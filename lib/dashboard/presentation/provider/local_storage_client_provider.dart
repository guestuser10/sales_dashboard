import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_dashboard/dashboard/infrastructure/infrastructure.dart';  //modelos imp

// Proveedor de IsarClienteDatasource
final localStorageClientProvider = Provider<IsarClienteDatasource>((ref) {
  return IsarClienteDatasource();
});
