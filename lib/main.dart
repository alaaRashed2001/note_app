import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DataBase/Colntroller/db_settings.dart';
import 'Views/note_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Database
  await DbSettings().initDatabase();

  /// App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: const NoteView(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        );
      },
    );
  }
}
