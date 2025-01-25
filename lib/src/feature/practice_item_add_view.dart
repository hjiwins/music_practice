import 'package:flutter/material.dart';
import 'package:music_practice/src/components/piece_item_view.dart';
import 'package:music_practice/src/feature/piece_item.dart';
import 'package:music_practice/src/practice_preferences/practice_manager.dart';
import 'package:music_practice/src/feature/practice_item.dart';

/// Displays detailed information about a SampleItem.
class PracticeItemAddView extends StatefulWidget {
  const PracticeItemAddView({super.key});

  static const routeName = '/practice_item_add';

  @override
  State<PracticeItemAddView> createState() => _PracticeItemAddViewState();
}

class _PracticeItemAddViewState extends State<PracticeItemAddView> {
  final practiceManager = PracticeManager();
  final formKey = GlobalKey<FormState>();

  List<PieceItem> pieceList = [];
  int test = 0;

  void add() async {
    formKey.currentState?.save();

    // if (title.isNotEmpty) {
    //   // final task = PracticeItem(1, title, duration, count);
    //   // await practiceManager.addPractice(task);
    // }
  }

  void validate(String? value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start New Practice'),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              //Limit 10 pieces per practice
              if (pieceList.length >= 10) return;
              setState(() {
                pieceList = [
                  ...pieceList,
                  PieceItem(pieceList.length + 1, '', 0, 1) // defalut piece item
                ];
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            onChanged: () {},
            child: ListView.builder(
              itemCount: pieceList.length,
              itemBuilder: (context, index) {
                return PieceItemView(
                  item: pieceList[index],
                  onSaved: (key, value) {
                    // TODO: update values when saved
                    pieceList[index];
                  },
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: FilledButton.tonal(
        onPressed: add,
        child: const Text('Start Practice'),
      ),
    );
  }
}
