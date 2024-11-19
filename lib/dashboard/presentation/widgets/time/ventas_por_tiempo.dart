import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/widgets.dart';
import '../../provider/providers.dart';
import 'package:sales_dashboard/dashboard/infrastructure/infrastructure.dart';

class VentasPorTiempoWidget extends ConsumerWidget {
  final clienteRepository = ClienteRepositoryImpl(IsarClienteDatasource());

  VentasPorTiempoWidget({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesDataRepository = ref.watch(salesDataRepositoryProvider);
    final selectedDate = ref.watch(dateProvider); 

    return FutureBuilder<List<SupermarketSales>>(
      future: salesDataRepository.getSalesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No hay datos de ventas.');
        }

        final salesData = snapshot.data!;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ExpansionTile(
                  title: const Text('Seleccionar Fecha'),
                  children: [
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(),
                      value: selectedDate != null ? [selectedDate] : [null],
                      onValueChanged: (dates) {
                        final newDate = dates.isNotEmpty ? dates[0] : null;
                        ref.read(dateProvider.notifier).updateDate(newDate);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SalesByHourChart(
                  salesData: salesData,
                  selectedDate: selectedDate,
                ),
                const SizedBox(height: 20),
                VentasPorDiaSemanaChart(
                  salesData: salesData,
                  selectedDate: selectedDate, 
                ),
                const SizedBox(height: 20),
                SalesByMonthChart(
                  salesData: salesData,
                  selectedDate: selectedDate,
                ),
                const SizedBox(height: 20),
                VentasPorLineaProductoChart(
                  salesData: salesData,
                  selectedDate: selectedDate, 
                ),
                const SizedBox(height: 20),
                SalesComparisonChart(
                  salesData: salesData,
                  selectedDate: selectedDate,
                ),
                
                DeudasWidget(
                  clienteId: 1, // Asegúrate de pasar un clienteId válido
                  clienteRepository: clienteRepository, // Aquí pasa la instancia concreta
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
