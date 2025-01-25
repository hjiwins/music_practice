import 'package:flutter/material.dart';
import 'package:music_practice/src/practice_preferences/practice_manager.dart';
import 'package:music_practice/src/feature/practice_item_add_view.dart';

import '../settings/settings_view.dart';
import 'practice_item_details_view.dart';

/// Displays a list of SampleItems.
class PracticeItemListView extends StatefulWidget {
  const PracticeItemListView({super.key});

  static const routeName = '/';

  @override
  State<PracticeItemListView> createState() => _PracticeItemListViewState();
}

class _PracticeItemListViewState extends State<PracticeItemListView> {
  final practiceManager = PracticeManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                PracticeItemAddView.routeName,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: FutureBuilder(
        future: practiceManager.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'PracticeItemListView',
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data?[index];
                return ListTile(
                  title: Text('Practice ${item?.id}'),
                  leading: const CircleAvatar(
                    foregroundImage:
                        AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                      arguments: {'id': item?.id}
                    );
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
