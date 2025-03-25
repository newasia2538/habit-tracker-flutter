import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:habit_tracking_flutter/data/database/tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Habits, HabitCompletions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future<List<Habit>> getHabits() => select(habits).get();
  Stream<List<Habit>> watchHabits() => select(habits).watch();

  Future<int> createHabit(HabitsCompanion habit) => into(habits).insert(habit);

  Stream<List<HabitWithCompletions>> watchHabitForDate(DateTime date) {
    final stateDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

    final query = select(habits).join([
      leftOuterJoin(
          habitCompletions,
          habitCompletions.habitId.equalsExp(habits.id) &
              habitCompletions.completionDate
                  .isBetweenValues(stateDate, endDate))
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final habit = row.readTable(habits);
        final completion = row.readTableOrNull(habitCompletions);

        return HabitWithCompletions(
            habit: habit, isCompleted: completion != null);
      }).toList();
    });
  }

  Future<bool> updateHabit(HabitsCompanion habit) =>
      update(habits).replace(habit);
  DeleteStatement<$HabitsTable, Habit> deleteHabit(int id) =>
      (delete(habits)..where((t) => t.id.equals(id)));

  Future<void> completeHabit(int habitId, DateTime selectedDate) async {
    await transaction(() async {
      final startDate =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      final endDate = DateTime(selectedDate.year, selectedDate.month,
          selectedDate.day, 23, 59, 59, 999);

      final existingCompletion = await (select(habitCompletions)
            ..where((t) =>
                t.habitId.equals(habitId) &
                t.completionDate
                    .isBetween(Variable(startDate), Variable(endDate))))
          .get();

      if (existingCompletion.isEmpty) {
        await into(habitCompletions).insert(HabitCompletionsCompanion(
            habitId: Value(habitId), completionDate: Value(selectedDate)));
      }

      final habit = await (select(habits)..where((t) => t.id.equals(habitId)))
          .getSingle();
      await update(habits).replace(habit
          .copyWith(
              streak: habit.streak + 1,
              totalCompletions: habit.totalCompletions + 1)
          .toCompanion(true));
    });
  }

  Stream<(int, int)> watchDailySummary(DateTime date) {
    final stateDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

    final completionStream = (select(habitCompletions)
          ..where((t) => t.completionDate
              .isBetween(Variable(stateDate), Variable(endDate))))
        .watch();

    final habitStream = watchHabitForDate(date);

    return Rx.combineLatest2(completionStream, habitStream,
        (completion, habit) => (completion.length, habit.length));
  }
}

class HabitWithCompletions {
  final Habit habit;
  final bool isCompleted;

  HabitWithCompletions({required this.habit, required this.isCompleted});
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'habits_tracker.db'));
    return NativeDatabase.createInBackground(file);
  });
}
