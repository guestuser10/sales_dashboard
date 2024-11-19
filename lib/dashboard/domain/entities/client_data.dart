import 'package:isar/isar.dart';


part 'client_data.g.dart';



@collection
class Cliente {
  Id id = Isar.autoIncrement;

  late String nombre;
  late String telefono;

  final deudas = IsarLinks<Deuda>(); // Relación con Deuda

  Cliente({
    required this.nombre,
    required this.telefono,
  });
}

@collection
class Deuda {
  Id id = Isar.autoIncrement;

  late String motivoDeDeuda;
  late double monto;
  double totalDeAbono = 0.0;

  late DateTime fechaUltimoAbono; //late
  bool activo = true;

  final cliente = IsarLink<Cliente>(); // Referencia cliente

  Deuda({
    required this.motivoDeDeuda,
    required this.monto,
    required this.fechaUltimoAbono, 
  });
}

@collection
class Pago {
  Id id = Isar.autoIncrement;

  late double montoDeAbono;
  late DateTime fechaPago;
  late double latitude; 
  late double longitude;

  final deuda = IsarLink<Deuda>(); 

  Pago({
    required this.montoDeAbono,
    required this.fechaPago,
    required this.latitude,
    required this.longitude,
    Deuda? deuda,
  }) {
    if (deuda != null) {
      this.deuda.value = deuda; 
    }
  }
}