import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAns = [];
  var activeScreen = 'start-screen';

  void chooseAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void reStartQuiz() {
    setState(() {
      // for (int i = 0; i < selectedAns.length; i++) {

      // }
      // while (!selectedAns.isNotEmpty) {
      //   selectedAns.removeLast();
      // }
      selectedAns.removeRange(0, selectedAns.length);
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(chooseAns);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAns, reStartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
