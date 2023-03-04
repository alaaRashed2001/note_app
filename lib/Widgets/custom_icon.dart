import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 46.w ,
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:  Icon(
        icon,
        size: 28 ,
      ),
    );
  }
}
