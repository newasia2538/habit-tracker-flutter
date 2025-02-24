import 'package:flutter/material.dart';

import 'habit_card.dart';

class HabitCardList extends StatelessWidget {
  const HabitCardList({super.key, required this.selectedDate});

  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (item, index) {
          return HabitCard(
            title: "Habbit $index",
            streak: 10,
            progress: 0.5,
            habitId: "habbit_$index",
            dateTime: selectedDate,
            isCompleted: index % 2 == 0,
          );
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 16,
        ),
      ),
    );
  }
}
