import 'package:flutter/material.dart';

import 'custom_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon}) : super(key: key);
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28 ,
          ),
        ),
        const Spacer(),
         CustomIcon(
          icon: icon,
        ),
      ],
    );
  }
}
