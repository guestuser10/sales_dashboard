import '../entities/sales_data.dart';

abstract class SalesDataDatasources {
  Future<List<SupermarketSales>> getSalesData();
}