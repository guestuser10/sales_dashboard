import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateTime?> {
  DateNotifier() : super(null); // Inicialmente sin fecha

  void updateDate(DateTime? newDate) {
    state = newDate;
  }
}
