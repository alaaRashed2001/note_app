import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_appbar.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController noteEditingController;

  late TextEditingController descriptionEditingController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState ();
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
      padding: const EdgeInsets.symmetric(
          horizontal: 24,



      ),
      child: Column(
        children:  [

           SizedBox(height: 56.h,),
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
       SizedBox(height: 56.h,),
          CustomTextField(
            controller: noteEditingController,
            hint: 'Edit Note',
            maxLines: 1,
          ),
           SizedBox(height: 16.h,),
          CustomTextField(
            controller: descriptionEditingController,
            hint: 'Edit Description',
            maxLines: 5,
          ),
           SizedBox(height: 16.h,),
          const EditNoteColorsList(),
        ],
      ),
    );
  }
}
