import 'package:flutter/material.dart';

import '../Const/color.dart';
import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2*28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) =>  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: InkWell(
            onTap: (){
             setState(() {
               currentIndex = index;
             });
            },
            child: ColorItem(
              color:kColors[index] ,
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
