import 'dart:io';

import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:face_net_authentication/question_module/myQuestioapp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'dart:math' as math;

class Profile extends StatelessWidget {
  const Profile(this.username, {Key key, this.imagePath}) : super(key: key);
  final String username;
  final String imagePath;

  final String githubURL = "https://google.com";

  void _launchURL() async => await canLaunch(githubURL)
      ? await launch(githubURL)
      : throw 'Could not launch $githubURL';

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              color: Colors.white,
            )
          ],
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(imagePath)),
                  ),
                ),
                margin: EdgeInsets.all(20),
                width: 50,
                height: 50,
              ),
              Text(
                'Hi ' + username + '!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: MyQuestionApp(
          name: username,
        ));
  }
}
