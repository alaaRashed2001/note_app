import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/DataBase/Colntroller/notes_controller.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Providers/note_provider.dart';
import 'package:provider/provider.dart';

import 'note_item.dart';

class NotesListview extends StatefulWidget {
   const NotesListview({Key? key}) : super(key: key);

  @override
  State<NotesListview> createState() => _NotesListviewState();
}

class _NotesListviewState extends State<NotesListview> {
   @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: 16.h
      ),
      child:Provider.of<NoteProvider>(context).allNotes.isNotEmpty? ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: Provider.of<NoteProvider>(context).allNotes.length,
          itemBuilder: (context, index) =>  Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6.h
            ),
            child:  NoteItem(note: Provider.of<NoteProvider>(context).allNotes [index]),
          ),
      ):Center(
        child: Lottie.asset('assets/lottie/noData.json'),
      ),
    );
  }
}
