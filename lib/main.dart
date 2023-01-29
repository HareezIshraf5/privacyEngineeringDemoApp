import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginpage/displayProfile.dart';
import 'LoginPage.dart';
import 'main.dart';
import 'FormPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

//const color = Color()
class MyApp extends StatelessWidget {
  static const String _title = 'Login Page';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: _title,
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return displayProfile();
            } else {
              return LoginPage();
            }
          },
        ),
      );
}
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance
    //         .collection("raw")
    //         .where("uid", isEqualTo: currentUser.currentUser!.uid)
    //         .snapshots(),
    //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasData) {
    //         return displayProfile();
    //       } else {
    //         return FormPage();
    //       }
    //     });

    //);
  

  // body: StreamBuilder<User?>(
  //   stream: FirebaseAuth.instance.authStateChanges(),
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData &&
  //         snapshot.data!.uid == currentUser.currentUser!.uid) {
  //       stream:
  //       FirebaseFirestore.instance
  //           .collection("raw")
  //           .where("uid", isEqualTo: currentUser.currentUser!.uid)
  //           .snapshots();
  //       return displayProfile();
  //     } else if (snapshot.hasData) {
  //       return FormPage();
  //     } else {
  //       return const MyStatefulWidget();
  //     }
  //     ;
  //   },
  // ),
  // );