import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  const HabitCard(
      {super.key,
      required this.title,
      required this.streak,
      required this.progress,
      required this.habitId,
      required this.isCompleted,
      required this.dateTime});

  final String title;
  final int streak;
  final double progress;
  final String habitId;
  final bool isCompleted;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outlineVariant),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                isCompleted
                    ? colorScheme.primaryContainer.withOpacity(0.8)
                    : colorScheme.surface.withOpacity(0.1),
                isCompleted
                    ? colorScheme.primaryContainer.withOpacity(0.6)
                    : colorScheme.surface.withOpacity(0.05)
              ]),
          boxShadow: [BoxShadow(color: colorScheme.shadow, blurRadius: 16)]),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    if (streak > 0) ...[
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('$streak days')
                        ],
                      )
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
