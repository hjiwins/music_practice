import 'package:flutter/material.dart';
import 'package:music_practice/src/practice_preferences/practice_manager.dart';

class SampleItemDetailsView extends StatefulWidget {
  const SampleItemDetailsView({super.key, required this.id});

  final int id;

  static const routeName = '/practice_item';

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  final practiceManager = PracticeManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id}'),
      ),
      body: FutureBuilder(
        future: practiceManager.getPractice(widget.id),
        builder: (context, snapshot) {
          return Center(
            child: snapshot.hasData
                ? Text('${snapshot.data?.date}')
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
