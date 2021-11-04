import 'package:app_history/screens/detailproduct.dart';
import 'package:app_history/screens/favourite.dart';
import 'package:app_history/screens/home.dart';
import 'package:app_history/screens/homepage.dart';
import 'package:app_history/screens/login.dart';
import 'package:app_history/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.onAuthStateChanged,
      //   builder: (ctx, snapShot) {
      //     if (snapShot.hasData) {
      //       return HomePage();
      //     } else {
      //       return Login();
      //     }
      //   },
      // ),
    );
  }
}
