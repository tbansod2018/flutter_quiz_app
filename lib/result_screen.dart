import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/quesions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.onRestart, {super.key});

  final Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final SummaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = SummaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionSuuummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
