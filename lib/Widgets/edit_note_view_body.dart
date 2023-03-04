import 'package:flutter/material.dart';
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

          const SizedBox(height: 56,),
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
      const SizedBox(height: 56,),
          CustomTextField(
            controller: noteEditingController,
            hint: 'Edit Note',
            maxLines: 1,
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            controller: descriptionEditingController,
            hint: 'Edit Description',
            maxLines: 5,
          ),
          const SizedBox(height: 16,),
          const EditNoteColorsList(),
        ],
      ),
    );
  }
}
