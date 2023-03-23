import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:face_net_authentication/question_module/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class ScoreScreen extends StatelessWidget {
  void _launchURL() async => await canLaunch(
          "https://in.indeed.com/jobs?q=flutter%20developer&l=Mumbai%2C%20Maharashtra")
      ? await launch(
          "https://in.indeed.com/jobs?q=flutter%20developer&l=Mumbai%2C%20Maharashtra")
      : throw 'Could not launch ';

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 3),
          Text(
            "Score",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: kSecondaryColor),
          ),
          Spacer(),
          Text(
            "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: kSecondaryColor),
          ),
          Spacer(flex: 3),
          Center(
            child: AppButton(
              onPressed: () {
                _launchURL();
              },
              text: "You are qualified for following job",
              icon: Icon(Icons.navigate_next_rounded),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
