import 'package:flutter/cupertino.dart';

import 'note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6
            ),
            child: NoteItem(),
          ),
      ),
    );
  }
}
