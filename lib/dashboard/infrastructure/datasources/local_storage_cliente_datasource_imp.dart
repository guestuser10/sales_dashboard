

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:whatsapp/whatsapp.dart';


class IsarClienteDatasource implements ClienteDatasource {
  late Future<Isar> _isar;

  IsarClienteDatasource() {
    _isar = _initDB(); // Asigna el resultado de la inicialización
  }

  Future<Isar> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([ClienteSchema, DeudaSchema, PagoSchema], directory: dir.path);
  }

  @override
  Future<void> insertarCliente(Cliente cliente) async {
    final isar = await _isar;
    await isar.writeTxn(() => isar.clientes.put(cliente));
  }
  
  @override
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, puedes solicitar que el usuario los active
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    // Verificar permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados
        return Future.error('Los permisos de ubicación están denegados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Los permisos están denegados permanentemente
      return Future.error(
          'Los permisos de ubicación están denegados permanentemente.');
    }

    // Obtener la ubicación actual
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<void> insertarDeuda(Deuda deuda, Cliente cliente) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      // Vincula la deuda con el cliente
      deuda.cliente.value = cliente;
      await isar.deudas.put(deuda); // Guarda la deuda en la base de datos
      
      // Agrega la deuda al cliente y guarda el cliente actualizado
      cliente.deudas.add(deuda);
      await isar.clientes.put(cliente); // Guarda el cliente en la base de datos
      
      // Asegura que las relaciones se actualicen en la base de datos
      await cliente.deudas.save();
      await deuda.cliente.save();
    });
  }

  @override
  Future<List<Cliente>> obtenerClientes() async {
    final isar = await _isar;
    return await isar.clientes.where().findAll();
  }

  @override
  Future<List<Deuda>> obtenerDeudasDeCliente(int clienteId) async {
    final isar = await _isar;
    final cliente = await isar.clientes.get(clienteId);

    if (cliente != null) {
      await cliente.deudas.load(); // Carga la relación explícitamente
      return cliente.deudas.toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> abonarDeuda(int deudaId, double monto) async {
    final isar = await _isar;
    final deuda = await isar.deudas.get(deudaId);
    final position = await getCurrentLocation();
    const accessToken ='EAAScVaVq69oBO7mZBii5vQlHR1wEL1sxfXPNFnBRC9ZC4JCZCUvuDwoZCQNmp8Lo735Hpt2lf7NqfGBxyRMs0sV6lytJVYhgxBgcVLNI2i4iVunvOofkMFIZAZCbQZAMSfaZB3hp5XI9vzYGnKTZALOdYPukstrVPZCP5W0TGZCXsmPZAzvLUC1P3jGJ8pTIDGZBeEg8YnmrzDEdqLdEsmbEWSvO14th8x1AZD';
    const fromNumberId = '475408848988801';

    final whatsapp = WhatsApp(accessToken, fromNumberId);

    if (deuda != null) {
      deuda.totalDeAbono += monto;
      deuda.fechaUltimoAbono = DateTime.now();

      await isar.writeTxn(() async {
        await isar.deudas.put(deuda);
        print('Deuda actualizada: ${deuda.totalDeAbono}, Último abono: ${deuda.fechaUltimoAbono}');
      });

      // Crea el pago y enlaza la deuda
      final pago = Pago(
        montoDeAbono: monto,
        fechaPago: DateTime.now(),
        latitude: position.latitude,
        longitude: position.longitude,
      );
      pago.deuda.value = deuda;

      // Guarda el pago con su relación
      await isar.writeTxn(() async {
        await isar.pagos.put(pago);
        await pago.deuda.save(); // Guarda la relación entre pago y deuda
      });
          var res = await whatsapp.sendMessage(
            phoneNumber : '6681064150',
            text : 'Deuda actualizada: ${deuda.totalDeAbono}, Último abono: ${deuda.fechaUltimoAbono}',
            previewUrl : true,
          );
          // await whatsapp.sendLocation(
          //   phoneNumber: 'PHONE_NUMBER',
          //   latitude: 25.197197,
          //   longitude: 55.2743764,
          //   name: "Burj Khalifa",
          //   address:"1 Sheikh Mohammed bin, United Arab Emirates"
          // );

        if (res.isSuccess()) {
            debugPrint('Message ID: ${res.getMessageId()}');
            debugPrint('Message sent to: ${res.getPhoneNumber()}');

    //Return exact API Response Body
            debugPrint('API Response: ${res.getResponse().toString()}');
        } else {
            debugPrint('HTTP Code: ${res.getHttpCode()}');

            // Will return exact error from WhatsApp Cloud API
            debugPrint('API Error: ${res.getErrorMessage()}');

            // Will return HTTP Request error
            debugPrint('Request Error: ${res.getError()}');

            //Return exact API Response Body
            debugPrint('API Response: ${res.getResponse().toString()}');
        }
    } else {
      print('Error: Deuda no encontrada');
    }

  }


  @override
  Future<List<Deuda>> obtenerDeudasMesDiferente(DateTime fechaConsulta) async {
    final isar = await _isar;
    final mesConsulta = fechaConsulta.month;
    return await isar.deudas.filter()
      .fechaUltimoAbonoBetween(
        DateTime(fechaConsulta.year, mesConsulta, 1),
        DateTime(fechaConsulta.year, mesConsulta + 1, 0),
      )
      .findAll();
  }

  @override
  Future<List<Deuda>> obtenerDeudasMesesAnteriores(DateTime fechaConsulta) async {
    final isar = await _isar;

    // Calcula la fecha de hace un mes
    final fechaLimite = DateTime(fechaConsulta.year, fechaConsulta.month - 1, fechaConsulta.day);

    return await isar.deudas.filter()
      .fechaUltimoAbonoLessThan(fechaLimite)
      .findAll();
  }

  double sumarPagos(List<Pago> pagos) {
    return pagos.fold<double>(0.0, (sum, pago) => sum + (pago.montoDeAbono));
  }

  @override
  Future<double> obtenerTotalAbonosMes(DateTime fechaConsulta) async {
    final isar = await _isar;

    final inicioMes = DateTime(fechaConsulta.year, fechaConsulta.month, 1);
    final finMes = DateTime(
      fechaConsulta.year,
      fechaConsulta.month < 12 ? fechaConsulta.month + 1 : 1,
      1,
    ).subtract(const Duration(days: 1));

    final List<Pago> pagos = await isar.pagos.filter()
      .fechaPagoBetween(inicioMes, finMes)
      .findAll();

    return sumarPagos(pagos);
  }


  @override
  Future<List<LatLng>> obtenerPagosPorFecha(DateTime fecha) async {
    final isar = await _isar;
    final startOfDay = DateTime(fecha.year, fecha.month, fecha.day);
    final endOfDay = DateTime(fecha.year, fecha.month, fecha.day, 23, 59, 59);

    // Realiza la consulta en el modelo Pago
    final pagos = await isar.pagos
        .filter()
        .fechaPagoBetween(startOfDay, endOfDay) // Filtra pagos
        .findAll();

    return pagos.map((pago) => LatLng(pago.latitude, pago.longitude)).toList();
  }


}




