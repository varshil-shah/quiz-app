import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onResetQuiz});
  final List<String> choosenAnswers;
  final void Function() onResetQuiz;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int noOfQuestions = questions.length;
    final noOfCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    const String fileName = 'assets/images/result.svg';
    final Size size = MediaQuery.of(context).size;
    debugPrint(choosenAnswers.toString());

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              fileName,
              width: size.width * 0.6,
            ),
            const SizedBox(height: 30),
            Text(
              'You answered $noOfCorrectAnswers out of $noOfQuestions questions correctly!!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(height: 20),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onResetQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 108, 99, 255),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
              ),
              icon: const Icon(
                Icons.replay,
                size: 24,
              ),
              label: const Text(
                "Restart Quiz!",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
