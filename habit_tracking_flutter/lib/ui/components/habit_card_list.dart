import 'package:flutter/material.dart';
import 'package:habit_tracking_flutter/data/providers/habits_for_date_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'habit_card.dart';

class HabitCardList extends HookConsumerWidget {
  const HabitCardList({super.key, required this.selectedDate});

  final DateTime selectedDate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsValue = ref.watch(habitForDateProvider(selectedDate));
    return habitsValue.when(
      data: (data) => Expanded(
        child: ListView.separated(
          itemBuilder: (item, index) {
            return HabitCard(
              title: data[index].habit.title,
              streak: data[index].habit.streak,
              progress: data[index].isCompleted ? 1 : 0,
              habitId: data[index].habit.id.toString(),
              dateTime: selectedDate,
              isCompleted: data[index].isCompleted,
            );
          },
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 16,
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
