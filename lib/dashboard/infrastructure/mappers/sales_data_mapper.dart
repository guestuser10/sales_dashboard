// import 'package:sales_dashboard/config/config.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';

class ProductMapper{
  static List<SupermarketSales> fromJson(List<dynamic> data) {
    return List<SupermarketSales>.from(data.map((x) => SupermarketSales.fromJson(x)));
  }
}