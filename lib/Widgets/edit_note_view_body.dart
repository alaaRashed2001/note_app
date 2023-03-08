import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/Helpers/snackbar.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Providers/note_provider.dart';
import 'package:provider/provider.dart';
import '../DataBase/Colntroller/notes_controller.dart';
import 'custom_appbar.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody>
    with SnackBarHelper {
  late TextEditingController noteEditingController;

  late TextEditingController descriptionEditingController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    noteEditingController = TextEditingController(text: widget.note.title);
    descriptionEditingController =
        TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    noteEditingController.dispose();
    descriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
          ),
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 56.h,
          ),
          CustomTextField(
            controller: noteEditingController,
            hint: 'Edit Note',
            maxLines: 1,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
            controller: descriptionEditingController,
            hint: 'Edit Description',
            maxLines: 5,
          ),
          SizedBox(
            height: 16.h,
          ),
          const EditNoteColorsList(),
          CustomButton(
            isLoading: isLoading,
            onPressed: () async {
              await performUpdate();
            },
            buttonName: 'Update',
          ),
        ],
      ),
    );
  }

  Future<void> performUpdate() async {
    if (checkData) {
      await update();
    }
  }

  Future<void> update() async {
    var status = await NotesDBController().updateNote(note);
    if (status) {
      Provider.of<NoteProvider>(context,listen: false).updateNote(note);
      showSnackBar(context, message: 'Done ❤', error: false);
      Navigator.of(context).pop();
    } else {
      showSnackBar(context, message: 'Error 😒', error: true);
    }
  }
  NoteModel get note {
    NoteModel noteModel = NoteModel();
    noteModel.id=widget.note.id;
    noteModel.title = noteEditingController.text;
    noteModel.subTitle = descriptionEditingController.text;
    noteModel.date = '';
    noteModel.color = 1;
    return noteModel;
  }
  bool get checkData {
    if (noteEditingController.text.isEmpty) {
      showSnackBar(context, message: 'Enter Title 😒', error: true);
      return false;
    } else if (descriptionEditingController.text.isEmpty) {
      showSnackBar(context, message: 'Enter Description  😒', error: true);
      return false;
    }
    return true;
  }
}
