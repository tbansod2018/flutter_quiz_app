import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAns, {super.key});

  final void Function(String ans) onSelectAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuesionIndex = 0;

  void ansQuestion(String selectedAns) {
    widget.onSelectAns(selectedAns);

    setState(() {
      currentQuesionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuesionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 94, 170, 233),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            //converting list of string to list of Widget
            ...currentQuestion.getShuffledAns().map(
              (answers) {
                return AnsButton(
                  answers,
                  () {
                    ansQuestion(answers);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
