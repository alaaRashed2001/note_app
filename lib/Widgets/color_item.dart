import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelected, required this.color}) : super(key: key);
final bool isSelected;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected ? Stack(
      alignment: Alignment.center,
      children:  [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
        ),
        const Center(child: Icon(Icons.check, color: Colors.white, size: 32,)),
      ],
    ):  CircleAvatar(
      radius: 28,
      backgroundColor: color,
    );
  }
}
