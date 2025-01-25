class PieceItem {
  const PieceItem(this.id, this.title, this.duration, this.count);

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
