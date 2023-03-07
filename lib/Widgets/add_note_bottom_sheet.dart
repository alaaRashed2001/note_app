import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/Helpers/snackbar.dart';

import '../DataBase/Colntroller/notes_controller.dart';
import '../Models/note_model.dart';
import 'colors_listview.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet>
    with SnackBarHelper {
  late TextEditingController noteEditingController;

  late TextEditingController descriptionEditingController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    noteEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
             shrinkWrap: true,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                CustomTextField(
                  controller: noteEditingController,
                  hint: 'Note',
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: descriptionEditingController,
                  hint: 'Description',
                  maxLines: 5,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const ColorsListView(),

              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
            isLoading: isLoading,
            onPressed: () async {
              await performCrateNote();
            },
            buttonName: 'Save',
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }

  Future<void> performCrateNote() async {
    if (checkData()) {
      await crateNote();
    }
  }

  Future<void> crateNote() async {
    var status = await NotesDBController().createNote(note);
    if (status > 0) {
      showSnackBar(context, message: 'Done ❤', error: false);
      Navigator.of(context).pop();
    } else {
      showSnackBar(context, message: 'Error 😒', error: true);
    }
  }

  NoteModel get note {
    NoteModel noteModel = NoteModel();
    noteModel.title = noteEditingController.text;
    noteModel.subTitle = descriptionEditingController.text;
    noteModel.date = '';
    noteModel.color = 1;
    return noteModel;
  }

  bool checkData() {
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
