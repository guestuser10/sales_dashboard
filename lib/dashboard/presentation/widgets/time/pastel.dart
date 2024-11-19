import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/shared/indicator.dart'; 

class VentasPorDiaSemanaChart extends StatelessWidget {
  final List<SupermarketSales> salesData;
  final DateTime? selectedDate;

  const VentasPorDiaSemanaChart({super.key, required this.salesData, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final salesByDay = _groupSalesByDay(salesData);

    if (salesByDay.isEmpty) {
      return const Center(child: Text('No hay ventas en este rango de fechas.'));
    }

    return Column(
      children: [
        const Text('Ventas de la Semana Según Fecha Seleccionada',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 300,
                height: 300,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: showingSections(salesByDay),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: _buildLegend(salesByDay.keys.toList()),
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(Map<String, double> salesByDay) {
  List<PieChartSectionData> sections = [];

  // Calcular el total de ventas
  double totalSales = salesByDay.values.reduce((a, b) => a + b);

  salesByDay.forEach((day, value) {
    // Calcular el porcentaje
    double percentage = (totalSales > 0) ? (value / totalSales) * 100 : 0;

    sections.add(PieChartSectionData(
      color: _getColorForDay(day),
      value: value,
      title: percentage > 0 ? '${percentage.toStringAsFixed(1)}%' : '',
      radius: 100,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ));
  });

  return sections;
}


  Widget _buildLegend(List<String> days) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: days.map((day) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Indicator(
            color: _getColorForDay(day),
            text: day,
            isSquare: true,
          ),
        );
      }).toList(),
    );
  }

  Map<String, double> _groupSalesByDay(List<SupermarketSales> salesData) {
    final Map<String, double> groupedSales = {};

    if (selectedDate != null) {
      DateTime startDate = selectedDate!.subtract(const Duration(days: 3)); // 3 días antes
      DateTime endDate = selectedDate!.add(const Duration(days: 3)); // 3 días después

      for (var sale in salesData) {
        DateTime saleDate = DateFormat('d/M/yyyy').parse(sale.date);

        // Filtrar ventas según el rango de fechas
        if (saleDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
            saleDate.isBefore(endDate.add(const Duration(days: 1)))) {
          String day = DateFormat('EEEE').format(saleDate); // Obtener el nombre del día

          if (!groupedSales.containsKey(day)) {
            groupedSales[day] = 0;
          }
          groupedSales[day] = groupedSales[day]! + sale.total;
        }
      }
    }
    return groupedSales;
  }

  Color _getColorForDay(String day) {
    switch (day) {
      case 'Monday':
        return Colors.blue;
      case 'Tuesday':
        return Colors.red;
      case 'Wednesday':
        return Colors.green;
      case 'Thursday':
        return Colors.orange;
      case 'Friday':
        return Colors.purple;
      case 'Saturday':
        return Colors.teal;
      case 'Sunday':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
