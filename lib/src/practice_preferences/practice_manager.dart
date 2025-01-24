import 'dart:convert';
import 'package:music_practice/src/feature/practice_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeManager {
  static const _key = 'practices';

  Future<void> addPractice(PracticeItem item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_key) ?? [];

    tasks.add(json.encode(item.toJson()));

    await prefs.setStringList(_key, tasks);
  }

  Future<void> remove(PracticeItem item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_key) ?? [];

    tasks.removeWhere((taskJson) {
      final practiceData = json.decode(taskJson);
      return practiceData['id'] == item.id;
    });

    await prefs.setStringList(_key, tasks);
  }

  Future<PracticeItem?> getPractice(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> practices = prefs.getStringList(_key) ?? [];

    final getPractice = practices.singleWhere((taskJson) {
      final practiceData = json.decode(taskJson);
      return practiceData['id'] == id;
    });

    final selectedPractice = jsonDecode(getPractice);

    return PracticeItem(
      selectedPractice['id'],
      selectedPractice['title'],
      selectedPractice['duration'],
      selectedPractice['count'],
    );
  }

  Future<List<PracticeItem>> getTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_key) ?? [];

    return tasks.map((taskJson) {
      final taskData = json.decode(taskJson);
      return PracticeItem(
        taskData['id'],
        taskData['title'],
        taskData['duration'],
        taskData['count'],
      );
    }).toList();
  }
}
