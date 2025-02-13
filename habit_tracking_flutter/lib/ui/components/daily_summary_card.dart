import 'package:flutter/material.dart';

class DailySummaryCard extends StatelessWidget {
  const DailySummaryCard(
      {super.key,
      required this.completedTasks,
      required this.totalTasks,
      required this.date});

  final int completedTasks;
  final int totalTasks;
  final String date;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 8,
      shadowColor: colorScheme.shadow.withOpacity(0.2),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Summary $date Completed Task : $completedTasks',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.primaryContainer,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
