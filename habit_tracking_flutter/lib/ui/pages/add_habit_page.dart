import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddHabitPage extends HookConsumerWidget {
  const AddHabitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final isDaily = useState(true);
    final hasReminder = useState(false);
    final reminderTime =
        useState<TimeOfDay?>(const TimeOfDay(hour: 10, minute: 0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Habit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Habit Title'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Goal'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Daily'),
                Switch(
                  value: isDaily.value,
                  onChanged: (value) => isDaily.value = value,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Reminder'),
            const SizedBox(
              height: 16,
            ),
            SwitchListTile(
              value: hasReminder.value,
              onChanged: (value) {
                hasReminder.value = value;
                if (value) {
                  showTimePicker(
                          context: context,
                          initialTime: reminderTime.value ??
                              TimeOfDay(hour: 10, minute: 0))
                      .then((time) {
                    if (time != null) {
                      reminderTime.value = time;
                    }
                  });
                }
              },
              title: const Text('Has Reminder'),
              subtitle: hasReminder.value
                  ? Text(reminderTime.value.toString())
                  : const Text('No Time Selected.'),
            )
          ],
        ),
      ),
    );
  }
}
