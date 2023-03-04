import 'package:flutter/material.dart';

import '../Const/color.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonName;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonName,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                buttonName,
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
