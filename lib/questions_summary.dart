import 'package:flutter/material.dart';
import 'package:my3/style_summary.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  
                  Design(((data['question_index'] as int) + 1).toString(),),
                  Expanded(
                    child: Column(
                      children: [
                        Design(data['question'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Design(data['user_answer'] as String),
                        Design(data['correct_answer'] as String),
          
                        const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
