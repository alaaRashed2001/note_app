import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditNoteView(),));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 24,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF00BCD4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Flutter Tips',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(
                  'Build your career with alaa rashed',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing:
                  IconButton(
                      onPressed: () {},
                      icon:   const Icon(
                          FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 24,
                      ),),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 24),
               child: Text(
                  'March1 , 2023',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
