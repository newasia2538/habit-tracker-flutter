import 'package:habit_tracking_flutter/data/providers/database_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final dailySummaryProvider =
    StreamProvider.family<(int completedTasks, int totalTasks), DateTime>(
        (ref, date) {
  final database = ref.watch(dataBaseProvider);
  return database.watchDailySummary(date);
});
