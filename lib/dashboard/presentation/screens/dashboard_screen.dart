import 'package:flutter/material.dart';
import 'package:sales_dashboard/dashboard/infrastructure/datasources/local_storage_cliente_datasource_imp.dart';
import 'package:sales_dashboard/dashboard/infrastructure/repositories/local_storage_cliente_repository_impl.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/shared/pagos.dart';

class DashboardScreen extends StatelessWidget {
  static const String name = 'dashboard';

  const DashboardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Gráficas de Venta'),
      ),
      body:  _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  _DashboardView();
  final clienteRepository = ClienteRepositoryImpl(IsarClienteDatasource());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            // const SizedBox(height: 10),
            // DeudaProgressBar(clienteRepository: clienteRepository),
            // const SizedBox(height: 20),
            DeudasWidget(
              clienteId: 1, 
              clienteRepository: clienteRepository, 
            ),
          ],
        ),
      ),
    );
  }
}
