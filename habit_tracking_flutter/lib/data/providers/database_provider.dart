import 'package:habit_tracking_flutter/data/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dataBaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
