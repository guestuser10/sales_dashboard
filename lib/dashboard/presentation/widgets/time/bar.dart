import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';


class SalesByHourChart extends StatelessWidget {
  final List<SupermarketSales> salesData;
  final DateTime? selectedDate; 

  const SalesByHourChart({
    super.key, 
    required this.salesData,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final filteredSales = salesData.where((sale) => _isSameDate(sale.date, selectedDate)).toList();
    final salesByHour = _groupSalesByTime(filteredSales, 'hour');

    if (salesByHour.isEmpty) {
      return const Center(child: Text('No hay ventas en este rango de fechas.'));
    }
    
    List<BarChartGroupData> barGroups = salesByHour.entries
    .map((entry) {
      final hour = entry.key;
      return BarChartGroupData(
        x: int.parse(hour),
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 15,
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
          ),
        ],
      );
    })
    .toList()
    ..sort((a, b) => a.x.compareTo(b.x));


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ventas del ${DateFormat('d/M/yyyy').format(selectedDate!)} por Hora', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              barGroups: barGroups,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text('${value.toInt()}:00', style: const TextStyle(fontSize: 12));
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d)),
              ),
              gridData: const FlGridData(show: true),
            ),
          ),
        ),
      ],
    );
  }

  bool _isSameDate(String saleDate, DateTime? targetDate) {
    if (targetDate == null) return false; // Si no hay fecha seleccionada
    final parsedSaleDate = DateFormat('d/M/yyyy').parse(saleDate);
    return parsedSaleDate.year == targetDate.year && parsedSaleDate.month == targetDate.month && parsedSaleDate.day == targetDate.day;
  }

  Map<String, double> _groupSalesByTime(List<SupermarketSales> salesData, String period) {
    final Map<String, double> groupedSales = {};

    for (var sale in salesData) {
      String key;
      DateTime saleDate = DateFormat('d/M/yyyy').parse(sale.date);

      switch (period) {
        case 'hour':
          key = sale.time.split(':')[0]; // Agrupar por hora sin :00
          break;
        case 'month':
          key = saleDate.month.toString(); // Agrupar por mes
          break;
        default:
          key = '';
      }

      if (!groupedSales.containsKey(key)) {
        groupedSales[key] = 0;
      }
      groupedSales[key] = groupedSales[key]! + sale.total; // Asegúrate de que `total` esté definido
    }

    return groupedSales;
  }
}

class SalesByMonthChart extends StatelessWidget {
  final List<SupermarketSales> salesData;
  final DateTime? selectedDate; // Agregar el parámetro para la fecha seleccionada

  const SalesByMonthChart({
    super.key, 
    required this.salesData,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final filteredSales = salesData.where((sale) => _isSameYear(sale.date, selectedDate)).toList();
    final salesByMonth = _groupSalesByTime(filteredSales, 'month');

    if (salesByMonth.isEmpty) {
      return const Center(child: Text('No hay ventas en este rango de fechas.'));
    }


    List<BarChartGroupData> barGroups = salesByMonth.entries
    .map((entry) {
      final month = int.parse(entry.key);
      return BarChartGroupData(
        x: month,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            width: 15,
            gradient: const LinearGradient(
              colors: [Colors.teal, Colors.cyan],
            ),
          ),
        ],
      );
    })
    .toList()
    ..sort((a, b) => a.x.compareTo(b.x)); 


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ventas del Año ${selectedDate?.year} por Mes', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              barGroups: barGroups,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const months = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
                      return Text(months[value.toInt() - 1], style: const TextStyle(fontSize: 12));
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d)),
              ),
              gridData: const FlGridData(show: true),
            ),
          ),
        ),
      ],
    );
  }

  bool _isSameYear(String date, DateTime? targetDate) {
    if (targetDate == null) return false; // Si no hay fecha seleccionada
    DateTime parsedDate = DateFormat('d/M/yyyy').parse(date);
    return parsedDate.year == targetDate.year; // Comparar solo el año
  }

  Map<String, double> _groupSalesByTime(List<SupermarketSales> salesData, String period) {
    final Map<String, double> groupedSales = {};

    for (var sale in salesData) {
      String key;
      DateTime saleDate = DateFormat('d/M/yyyy').parse(sale.date);

      switch (period) {
        case 'month':
          key = saleDate.month.toString(); // Agrupar por mes
          break;
        default:
          key = '';
      }

      if (!groupedSales.containsKey(key)) {
        groupedSales[key] = 0;
      }
      groupedSales[key] = groupedSales[key]! + sale.total;
    }

    return groupedSales;
  }
}
