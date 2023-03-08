import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/DataBase/Colntroller/notes_controller.dart';
import 'package:note_app/Helpers/snackbar.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Providers/note_provider.dart';
import 'package:provider/provider.dart';

import '../Views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  final NoteModel note;
  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem>with SnackBarHelper {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditNoteView(),));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 24,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF00BCD4),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title:  Text(
                widget.note.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26.sp,
                ),
              ),
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                 widget.note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.sp,
                  ),
                ),
              ),
              trailing:
                  IconButton(
                      onPressed: () async{
                        await deleteNote();
                      },
                      icon:   const Icon(
                          FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 24,
                      ),),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 24),
               child: Text(
                  widget.note.date?? '',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16.sp,
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteNote()async{
var status =  await NotesDBController().deleteNote(widget.note.id);
 if(status){
  Provider.of<NoteProvider>(context,listen: false).deleteNote(widget.note.id);
  showSnackBar(context, message: 'Delete Success ✔', error: false);
 }else{
 showSnackBar(context, message: 'ERROR => Delete Failed 😢', error: true);
 }
  }
}
