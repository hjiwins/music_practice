import 'package:flutter/material.dart';
import 'package:music_practice/src/feature/piece_item.dart';

class PieceItemView extends StatelessWidget {
  const PieceItemView({
    super.key,
    this.item,
    this.onSaved,
  });

  final PieceItem? item;
  final void Function(String, String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: item?.title);
    final TextEditingController durationController =
        TextEditingController(text: item?.duration.toString());
    final TextEditingController countController =
        TextEditingController(text: item?.count.toString());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 8,
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Title'),
            ),
            onSaved: (newValue) => onSaved?.call('title', newValue),
          ),
          // TODO: change input (number input)
          TextFormField(
            controller: durationController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Duration'),
            ),
          ),
          TextFormField(
            controller: countController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Count'),
            ),
          ),
        ],
      ),
    );
  }
}
