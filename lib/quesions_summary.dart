import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionSuuummary extends StatelessWidget {
  const QuestionSuuummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.green,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.circular(2)),

                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            (data['question']) as String),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 199, 126, 126),
                            ),
                            data['user_answer'] as String),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                            data['correct_answer'] as String),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
