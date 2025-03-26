import 'package:habit_tracking_flutter/data/database/database.dart';
import 'package:habit_tracking_flutter/data/providers/database_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final habitForDateProvider =
    StreamProvider.family<List<HabitWithCompletions>, DateTime>((ref, date) {
  final database = ref.watch(dataBaseProvider);
  return database.watchHabitForDate(date);
});
