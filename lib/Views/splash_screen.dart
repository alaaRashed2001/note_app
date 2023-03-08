import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/DataBase/Colntroller/notes_controller.dart';
import 'package:note_app/Providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'note_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NoteView(),
      ));
    });
  }

  Future<void> getNotes()async{
    var notes =   await NotesDBController().readNote();
    Provider.of<NoteProvider>(context,listen: false).setNotes(notes);
  }

  Future<void> init() async {
    await navigate();
   await getNotes();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Lottie.asset('assets/lottie/note.json'),
              Text(
                'Note App',
                style: TextStyle(
                  color:  Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Alaa Rashed',
                style: TextStyle(
                  color:  Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
