import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' as rootbundle;

// import 'package:sales_dashboard/config/config.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';

class SalesDataDatasourceImp extends SalesDataDatasources{
  final Dio dio = Dio();

  @override
  Future<List<SupermarketSales>> getSalesData() async {
    try {
      // final response = await dio.get('${Config.baseUrl}/sales');
      // final data = response.data;

      final String response = await rootbundle.rootBundle.loadString('assets/supermarket_sales.json');
      final data = json.decode(response);

      return List<SupermarketSales>.from(data.map((x) => SupermarketSales.fromJson(x)));
    } catch (e) {
      throw Exception(e);
    }
  }
}