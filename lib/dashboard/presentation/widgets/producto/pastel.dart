import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:sales_dashboard/dashboard/presentation/widgets/widgets.dart';

class VentasPorLineaProductoChart extends StatelessWidget {
  final List<SupermarketSales> salesData;
  final DateTime? selectedDate; // Añadir parámetro para la fecha seleccionada

  const VentasPorLineaProductoChart({
    super.key,
    required this.salesData,
    this.selectedDate, // Incluir en el constructor
  });

  @override
  Widget build(BuildContext context) {
    // Filtrar y agrupar ventas por línea de producto según la fecha seleccionada
    final salesByProductLine = _groupSalesByProductLine(salesData);

    if (salesByProductLine.isEmpty) {
      return const Center(child: Text('No hay ventas en este rango de fechas.'));
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Ventas por Línea de Producto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            // Gráfico de pastel
            Expanded(
              flex: 1, // Controla el tamaño relativo de la gráfica
              child: SizedBox(
                width: 200, // Tamaño de la gráfica
                height: 200,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 0, // Cambiar el centro del gráfico
                    sections: showingSections(salesByProductLine),
                  ),
                ),
              ),
            ),
            // Espacio entre la gráfica y la leyenda
            const SizedBox(width: 20),
            // Leyenda de colores
            Expanded(
              flex: 1, // Controla el tamaño relativo de la leyenda
              child: _buildLegend(salesByProductLine.keys.toList()),
            ),
          ],
        ),
      ],
    );
  }

  // Agrupar ventas por línea de producto según la fecha seleccionada
  Map<String, double> _groupSalesByProductLine(List<SupermarketSales> salesData) {
    final Map<String, double> groupedSales = {};

    for (var sale in salesData) {
      DateTime saleDate = DateFormat('d/M/yyyy').parse(sale.date);

      // Filtrar ventas según la fecha seleccionada
      if (selectedDate != null && saleDate.year == selectedDate!.year && saleDate.month == selectedDate!.month) {
        String productLine = sale.productLine;

        if (!groupedSales.containsKey(productLine)) {
          groupedSales[productLine] = 0;
        }
        groupedSales[productLine] = groupedSales[productLine]! + sale.total;
      }
    }
    return groupedSales;
  }

  List<PieChartSectionData> showingSections(Map<String, double> salesByProductLine) {
  List<PieChartSectionData> sections = [];

  // Calcular el total de ventas
  double totalSales = salesByProductLine.values.reduce((a, b) => a + b);

  salesByProductLine.forEach((productLine, value) {
    // Calcular el porcentaje
    double percentage = (totalSales > 0) ? (value / totalSales) * 100 : 0;

    sections.add(PieChartSectionData(
      color: _getColorForProductLine(productLine),
      value: value,
      title: percentage > 0 ? '${percentage.toStringAsFixed(1)}%' : '',
      radius: 100, // Ajustar el tamaño de las secciones si es necesario
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ));
  });

  return sections;
}


  // Construir la leyenda de colores
  Widget _buildLegend(List<String> productLines) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centrar los indicadores verticalmente
      children: productLines.map((productLine) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0), // Espacio entre los indicadores
          child: Indicator(
            color: _getColorForProductLine(productLine),
            text: productLine,
            isSquare: true,
          ),
        );
      }).toList(),
    );
  }

  // Asignar colores a cada línea de producto
  Color _getColorForProductLine(String productLine) {
    switch (productLine) {
      case 'Electronic accessories':
        return Colors.blue;
      case 'Fashion accessories':
        return Colors.red;
      case 'Food and beverages':
        return Colors.green;
      case 'Sports and travel':
        return Colors.purple;
      case 'Home and lifestyle':
        return Colors.teal;
      default:
        return Colors.orange;
    }
  }
}
