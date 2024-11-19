import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_dashboard/dashboard/domain/domain.dart';
import 'package:sales_dashboard/dashboard/infrastructure/infrastructure.dart';

final salesDataRepositoryProvider = Provider<SalesDataRepository>((ref) {
  final salesDataRepository = SalesDataRepositoryImp(
    SalesDataDatasourceImp()
  );
  return salesDataRepository;
});
