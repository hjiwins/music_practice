import 'package:music_practice/src/feature/piece_item.dart';

class PracticeItem {
  const PracticeItem(this.id, this.title, this.date, this.pieces);

  final int id;
  final String title;
  final DateTime date;
  final List<PieceItem> pieces;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'pieces': pieces,
    };
  }
}
