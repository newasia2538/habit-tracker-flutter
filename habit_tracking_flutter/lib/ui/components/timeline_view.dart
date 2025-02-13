import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onSelectedDate;

  const TimelineView(
      {super.key, required this.selectedDate, required this.onSelectedDate});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: EasyDateTimeLine(
          initialDate: selectedDate,
          onDateChange: onSelectedDate,
          headerProps: EasyHeaderProps(
              monthPickerType: MonthPickerType.dropDown,
              showHeader: false,
              showSelectedDate: true),
          dayProps: EasyDayProps(
              dayStructure: DayStructure.dayNumDayStr,
              activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [colorScheme.primary, colorScheme.secondary],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  dayStrStyle: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  dayNumStyle: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.surface,
                      border: Border.all(
                          color: colorScheme.outlineVariant, width: 1)),
                  dayStrStyle:
                      TextStyle(color: colorScheme.onSurface, fontSize: 16),
                  dayNumStyle:
                      TextStyle(color: colorScheme.onSurface, fontSize: 16)),
              todayHighlightStyle: TodayHighlightStyle.withBorder,
              todayHighlightColor:
                  colorScheme.primaryContainer.withOpacity(0.8),
              todayStyle: DayStyle(
                  dayStrStyle:
                      TextStyle(color: colorScheme.primary, fontSize: 16),
                  dayNumStyle:
                      TextStyle(color: colorScheme.primary, fontSize: 16))),
          timeLineProps: EasyTimeLineProps(separatorPadding: 16)),
    );
  }
}
