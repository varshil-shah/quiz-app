import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreeen extends StatelessWidget {
  const StartScreeen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    const String imagePath = 'assets/images/home-banner.svg';
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              imagePath,
              width: size.width * 0.9,
            ),
            const SizedBox(height: 50),
            Text(
              "Learn Flutter the Fun Way!!!",
              style: GoogleFonts.poppins(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 108, 99, 255),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
                size: 24,
              ),
              label: const Text(
                "Start Quiz!",
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
