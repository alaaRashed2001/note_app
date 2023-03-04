import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24
      ),
      child: Column(
        children:  const [
          SizedBox(height: 56,),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          // Expanded(child: NotesListview()),
        ],
      ),
    );
  }
}
