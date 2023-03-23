import 'package:face_net_authentication/question_module/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyQuestionApp extends StatelessWidget {
  final String name;
  MyQuestionApp({@required this.name});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(
        name: this.name,
      ),
    );
  }
}
