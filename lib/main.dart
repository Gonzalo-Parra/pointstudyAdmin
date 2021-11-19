import 'package:flutter/material.dart';
import 'package:pointstudy_admin/UI/Pages/HomePage.dart';
import 'package:pointstudy_admin/UI/Pages/RegisterSchoolPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pointstudy_admin/UI/Pages/UpdateSchoolPage.dart';
import 'package:pointstudy_admin/UI/Pages/deleteSchoolPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage',
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        RegisterSchoolPage.id: (context) => RegisterSchoolPage(),
        UpdateSchoolPage.id: (context) => UpdateSchoolPage(),
        DeleteSchoolPage.id: (context) => DeleteSchoolPage(),
      },
    );
  }
}
