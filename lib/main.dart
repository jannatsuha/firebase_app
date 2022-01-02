import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/screen/login.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
