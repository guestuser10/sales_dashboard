import '../entities/sales_data.dart';

abstract class SalesDataRepository {
  Future<List<SupermarketSales>> getSalesData();
}