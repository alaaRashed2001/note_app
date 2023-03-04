import 'package:flutter/cupertino.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';


class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
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
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 32,),
            CustomTextField(
              controller: noteEditingController,
              hint: 'Note',
            ),
            const SizedBox(height: 16,),
            CustomTextField(
              controller: descriptionEditingController,
              hint: 'Description',
              maxLines: 5,
            ),
            // const SizedBox(height: 16,),
            // const ColorsListView(),
            // const SizedBox(height: 16,),
             CustomButton(
               isLoading: isLoading,
               onPressed: (){},
               buttonName: 'Save',
             ),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
