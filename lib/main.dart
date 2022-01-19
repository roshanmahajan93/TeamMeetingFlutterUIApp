import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeting_app/view/SplashView.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
