import 'package:flutter/material.dart';

import '../Const/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint,  this.maxLines =1, required this.controller}) : super(key: key);
final String hint;
final int maxLines;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      cursorColor:  kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kPrimaryColor,
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimaryColor),

      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(
          color:color?? Colors.white,
        )
      );
  }
}
