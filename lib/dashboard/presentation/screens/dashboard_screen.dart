import 'package:flutter/material.dart';
import 'package:sales_dashboard/dashboard/infrastructure/datasources/local_storage_cliente_datasource_imp.dart';
import 'package:sales_dashboard/dashboard/infrastructure/repositories/local_storage_cliente_repository_impl.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/shared/pagos.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        actions: [
            IconButton(
            icon: const Icon(Icons.question_mark, size: 30.0), 
            color: Colors.black,
            onPressed: () async {
              const url = 'https://wa.me/5216679156784?text=ayuda';
              if (await canLaunchUrlString(url)) {
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
              }
            },
            ),
        ],
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
