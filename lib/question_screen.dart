import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String ans) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    debugPrint("ANS: $selectedAnswer");
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final QuizQuestion question = questions[currentQuestionIndex];
    const String imagePath = "assets/images/flutter.svg";

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 80,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 51, 51, 51),
                fontSize: 22,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.shuffleAnswers.map(
              (value) => AnswerButton(
                answerText: value,
                onTap: () => answerQuestion(value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
