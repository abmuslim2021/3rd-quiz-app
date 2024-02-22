import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  Color.fromARGB(
                          255, 255, 102, 153), // Pink color
                    ),
                    padding: const EdgeInsets.all(
                        11.0), // Adjust the padding as needed
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 46, 46, 46), // Text color
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 208, 137, 255),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 155, 210, 255),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
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
