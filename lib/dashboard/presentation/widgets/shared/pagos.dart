import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/shared/progress_graph.dart';

class DeudasWidget extends StatefulWidget {
  final int clienteId;
  final ClienteRepository clienteRepository;

  const DeudasWidget({
    super.key,
    required this.clienteId,
    required this.clienteRepository,
  });

  @override
  DeudasWidgetState createState() => DeudasWidgetState();
}

class DeudasWidgetState extends State<DeudasWidget> {
  late Future<Isar> _isarFuture;
  late Future<List<Deuda>> _deudasFuture;

  @override
  void initState() {
    super.initState();
    _isarFuture = _initializeIsar();
    //insertarDatosDePrueba(widget.clienteRepository);
    loadDeudas();
  }

  Future<Isar> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    Future<Isar> isar = Isar.open([ClienteSchema, DeudaSchema, PagoSchema], directory: dir.path);
    return isar;
  }

  void loadDeudas() {
    DateTime now = DateTime.now();
    _deudasFuture = _isarFuture.then((isar) => widget.clienteRepository.obtenerDeudasMesesAnteriores(now));
  }

  void _showAbonoModal(BuildContext context, int deudaId) {
    final abonoController = TextEditingController();
    final focusNode = FocusNode();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final focusNode = FocusNode();

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                focusNode: focusNode, 
                controller: abonoController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
                ],
                decoration: const InputDecoration(
                  labelText: 'Monto de Abono',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () async {
                    final monto = double.tryParse(abonoController.text);
                    if (monto != null && monto > 0) {
                      await widget.clienteRepository.abonarDeuda(deudaId, monto);
                      setState(() {
                        loadDeudas();
                      });
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor ingrese un monto válido'),
                        ),
                      );
                    }
                  },
                  child: const Text('Confirmar Abono'),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      Future.delayed(Duration.zero, () {
        focusNode.requestFocus(); 
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Isar>(
  future: _isarFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return const Center(child: Text('Error al conectar con la base de datos'));
    }

    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height, // Establece un tamaño mínimo
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              DeudaProgressBar(clienteRepository: widget.clienteRepository),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    loadDeudas();
                  });
                },
                child: const Text('Actualizar deudores'),
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<Deuda>>(
                future: _deudasFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error al cargar deudas'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No hay deudas'));
                  }

                  final deudas = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: deudas.length,
                    itemBuilder: (context, index) {
                      final deuda = deudas[index];
                      final nombreCliente = deuda.cliente.value?.nombre ?? 'Cliente desconocido';

                      return GestureDetector(
                        onTap: () => _showAbonoModal(context, deuda.id),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nombreCliente,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Deuda: ${deuda.monto} / Abonado: ${deuda.totalDeAbono}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Arial',
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Último Abono: ${deuda.fechaUltimoAbono.year}-${deuda.fechaUltimoAbono.month}-${deuda.fechaUltimoAbono.day}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  },
);

  }
}


Future<int> insertarDatosDePrueba(ClienteRepository clienteRepository) async {
  final sar = Isar.getInstance();
  await sar?.writeTxn(() async {
    await sar.clear();
    await sar.clientes.clear();
    await sar.deudas.clear();
    await sar.pagos.clear();
  });

  // Crear una lista de clientes de prueba
  final clientes = [
    Cliente(nombre: 'Juan Pérez', telefono: '123456789'),
    Cliente(nombre: 'María López', telefono: '987654321'),
    Cliente(nombre: 'Carlos Sánchez', telefono: '456123789'),
    Cliente(nombre: 'Ana García', telefono: '321654987'),
  ];

  // Insertar cada cliente y su correspondiente deuda
  for (var cliente in clientes) {
    await clienteRepository.insertarCliente(cliente);

    // Verificar que el ID del cliente esté asignado
    if (cliente.id == 0) {
      throw Exception('Error: el cliente ${cliente.nombre} no tiene un ID asignado.');
    }

    // Crear una única deuda para cada cliente
    final deuda = Deuda(
      motivoDeDeuda: 'Pago de servicio de ${cliente.nombre}',
      monto: (cliente.nombre.length * 100).toDouble(), // Monto basado en la longitud del nombre
      fechaUltimoAbono: DateTime.now().subtract(const Duration(days: 61)),
    );
    deuda.cliente.value = cliente; // Asociar la deuda al cliente

    // Insertar la deuda en el cliente
    await clienteRepository.insertarDeuda(deuda, cliente);
  }

  print("Clientes: ${await clienteRepository.obtenerClientes()}");
  for (var cliente in clientes) {
    print("Deudas del Cliente ${cliente.nombre}: ${await clienteRepository.obtenerDeudasDeCliente(cliente.id)}");
  }
  print("Datos de prueba insertados con éxito.");

  // Retornar el ID del último cliente insertado
  return clientes.last.id;
}
