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
      ),
    );
  }
}
