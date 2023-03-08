import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_appbar.dart';
import 'notes_listview.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children:  [
          SizedBox(
            height: 56.h,
          ),
          const CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
            const Expanded(child: NotesListview()),
        ],
      ),
    );
  }
}
