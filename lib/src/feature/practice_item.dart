/// A placeholder class that represents an entity or model.
class PracticeItem {
  const PracticeItem(this.id, this.title, this.duration, this.count);

  final int id;
  final String title;
  final int duration;
  final int count;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'count': count,
    };
  }
}
