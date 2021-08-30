import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:sowmya_youtube/pages/auth/login_page.dart';

import 'package:sowmya_youtube/pages/home_page.dart';
import 'package:sowmya_youtube/pages/login_page.dart';

// TODO: Add SHA1 of Release Keystore in firebase
// TODO: Add Apple App Id in firebase

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Orange',

      home: LoginPageTwo(),
    );
  }
}

