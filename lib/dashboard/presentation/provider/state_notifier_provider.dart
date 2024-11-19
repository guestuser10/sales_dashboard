import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_dashboard/dashboard/presentation/provider/date_notifier.dart';

final dateProvider = StateNotifierProvider<DateNotifier, DateTime?>((ref) {
  return DateNotifier();
});
