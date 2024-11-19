
// import 'package:sales_dashboard/config/config.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';

class SalesDataRepositoryImp extends SalesDataRepository{
  final SalesDataDatasources datasource;

  SalesDataRepositoryImp(this.datasource);

  @override
  Future<List<SupermarketSales>> getSalesData() async {
    try {
      return await datasource.getSalesData();
    } catch (e) {
      throw Exception(e);
    }
  }
}