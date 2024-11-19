import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';

class SalesComparisonChart extends StatelessWidget {
  final List<SupermarketSales> salesData;
  final DateTime? selectedDate;

  const SalesComparisonChart({
    super.key,
    required this.salesData,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedDate == null) {
      return const Center(child: Text('No hay ventas en este rango de fechas.'));
    }

    // Ahora selectedDate es seguro para usar, así que puedes desreferenciarlo
    final todaySales = _getSalesByHour(selectedDate!);
    final yesterdaySales = _getSalesByHour(selectedDate!.subtract(const Duration(days: 1)));

    List<FlSpot> todaySpots = List.generate(24, (index) => FlSpot(index.toDouble(), todaySales[index]));
    List<FlSpot> yesterdaySpots = List.generate(24, (index) => FlSpot(index.toDouble(), yesterdaySales[index]));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: Text('Comparacion de ventas del dia' , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(
            LineChartData(
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: todaySpots,
                  isCurved: true,
                  color: Colors.blue,
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: yesterdaySpots,
                  isCurved: true,
                  color: Colors.red,
                  dotData: const FlDotData(show: false),
                ),
              ],
              borderData: FlBorderData(show: true),
            ),
          ),
        ),
      ],
    );
  }

  List<double> _getSalesByHour(DateTime date) {
    List<double> salesByHour = List.filled(24, 0);

    for (var sale in salesData) {
      DateTime saleDate = DateFormat('d/M/yyyy').parse(sale.date);
      if (saleDate.year == date.year && saleDate.month == date.month && saleDate.day == date.day) {
        int hour = int.parse(sale.time.split(':')[0]);
        salesByHour[hour] += sale.total;
      }
    }

    return salesByHour;
  }
}
