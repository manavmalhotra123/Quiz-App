import 'package:flutter/material.dart';

import 'package:my3/data/questions.dart';
import 'package:my3/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

  final summaryData = getSummaryData();
  final numTotalQuestions = questions.length;
  final numCorrectQuestion = summaryData.where((data) {
    return data['user_answer'] == data['correct_answer'];
  }).length;
  

  


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numTotalQuestions out of $numCorrectQuestion questions correctly!',
            style: const TextStyle(fontSize: 18,
            color: Colors.blue,
            fontWeight: FontWeight.w600),
            ),
            
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black
              ),
              onPressed:
                onRestart,
              
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
