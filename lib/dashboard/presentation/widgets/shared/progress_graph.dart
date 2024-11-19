import 'package:flutter/material.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DeudaProgressBar extends StatelessWidget {
  final ClienteRepository clienteRepository;

  const DeudaProgressBar({super.key, required this.clienteRepository});

  Future<double> _calculateTotalDeudas(List<Deuda> deudas) async {
    // Suma total de las deudas
    double total = 0;
    for (var deuda in deudas) {
      total += deuda.monto;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    // Cargar deudas pasadas y actuales cada vez que se reconstruye
    final deudasPasadasFuture = clienteRepository.obtenerDeudasMesesAnteriores(now);
    final deudasActualesFuture = clienteRepository.obtenerDeudasMesDiferente(now);

    return FutureBuilder<List<List<Deuda>>>(
      future: Future.wait([deudasPasadasFuture, deudasActualesFuture]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar deudas'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay deudas disponibles'));
        }

        // Desempaquetar las listas de deudas
        final deudasPasadas = snapshot.data![0];
        final deudasActuales = snapshot.data![1];

        // Calcular totales
        return FutureBuilder<List<double>>(
          future: Future.wait([_calculateTotalDeudas(deudasPasadas), _calculateTotalDeudas(deudasActuales)]),
          builder: (context, totalsSnapshot) {
            if (totalsSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (totalsSnapshot.hasError) {
              return const Center(child: Text('Error al calcular totales'));
            } else if (!totalsSnapshot.hasData || totalsSnapshot.data!.isEmpty) {
              return const Center(child: Text('No se pudieron calcular los totales'));
            }

            final totalDeudasPasadas = totalsSnapshot.data![0];
            final totalDeudasActuales = totalsSnapshot.data![1];
            final valorPorcentaje = totalDeudasActuales / (totalDeudasActuales + totalDeudasPasadas) * 100;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleCircularProgressBar(
                  valueNotifier: ValueNotifier(valorPorcentaje),
                  mergeMode: true,
                  animationDuration: 1,
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()}%',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        );
      },
    );
  }
}
