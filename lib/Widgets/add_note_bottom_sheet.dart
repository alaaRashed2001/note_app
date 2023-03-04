import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_listview.dart';
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
             SizedBox(height: 32.h,),
            CustomTextField(
              controller: noteEditingController,
              hint: 'Note',
            ),
             SizedBox(height: 16.h,),
            CustomTextField(
              controller: descriptionEditingController,
              hint: 'Description',
              maxLines: 5,
            ),
             SizedBox(height: 16.h,),
            const ColorsListView(),
             SizedBox(height: 16.h,),
             CustomButton(
               isLoading: isLoading,
               onPressed: (){},
               buttonName: 'Save',
             ),
             SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
