import 'package:flutter/material.dart';
import 'package:music_practice/src/practice_preferences/practice_manager.dart';
import 'package:music_practice/src/feature/practice_item.dart';

/// Displays detailed information about a SampleItem.
class PracticeItemAddView extends StatelessWidget {
  const PracticeItemAddView({super.key});

  static const routeName = '/practice_item_add';

  @override
  Widget build(BuildContext context) {
    final practiceManager = PracticeManager();

    final TextEditingController titleController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    final TextEditingController countController = TextEditingController();

    void add() async {
      final title = titleController.text;
      final duration = int.parse(durationController.text);
      final count = int.parse(countController.text);
      if (title.isNotEmpty) {
        final task = PracticeItem(1, title, duration, count);
        await practiceManager.addPractice(task);
        titleController.clear();
        durationController.clear();
        countController.clear();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Title'),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Duration'),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: countController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Count'),
                  ),
                ),
                FilledButton.tonal(
                  onPressed: add,
                  child: const Text('Start Practice'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
