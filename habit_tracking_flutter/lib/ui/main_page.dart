import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracking_flutter/data/providers/daily_summary_provider.dart';
import 'package:habit_tracking_flutter/ui/components/daily_summary_card.dart';
import 'package:habit_tracking_flutter/ui/components/habit_card_list.dart';
import 'package:habit_tracking_flutter/ui/components/timeline_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/add_habit_page.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState(DateTime.now());
    final colorScheme = Theme.of(context).colorScheme;
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
                  SizedBox(
                    height: 16,
                  ),
                  ref.watch(dailySummaryProvider(selectedDate.value)).when(
                        data: (data) => DailySummaryCard(
                            completedTasks: data.$1,
                            totalTasks: data.$2,
                            date:
                                '${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}'),
                        loading: () => const SizedBox.shrink(),
                        error: (error, stack) => Text(error.toString()),
                      ),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [colorScheme.primary, colorScheme.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.2),
                  blurRadius: 16,
                  spreadRadius: 4)
            ]),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddHabitPage())),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: const Text(
                  'Add Habit ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }
}
