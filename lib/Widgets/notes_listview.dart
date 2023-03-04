import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: 16.h
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
          itemBuilder: (context, index) =>  Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6.h
            ),
            child: const NoteItem(),
          ),
      ),
    );
  }
}
