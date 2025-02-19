import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracking_flutter/ui/components/daily_summary_card.dart';
import 'package:habit_tracking_flutter/ui/components/habit_card_list.dart';
import 'package:habit_tracking_flutter/ui/components/timeline_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Habit Tracker')),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimelineView(
                    selectedDate: selectedDate.value,
                    onSelectedDate: (date) => selectedDate.value = date,
                  ),
                  DailySummaryCard(
                      completedTasks: 8,
                      totalTasks: 10,
                      date:
                          '${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}'),
                  SizedBox(
                    height: 16,
                  ),
                  const Text('Habits'),
                  SizedBox(
                    height: 16,
                  ),
                  HabitCardList(
                    selectedDate: selectedDate.value,
                  )
                ],
              ))),
    );
  }
}
