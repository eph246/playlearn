import 'dart:math';
import 'package:flutter/material.dart';
import 'quiz_page_base.dart';

class QuizSubtractionPage extends StatefulWidget {
  const QuizSubtractionPage({super.key});

  @override
  State<QuizSubtractionPage> createState() => _QuizSubtractionPageState();
}

class _QuizSubtractionPageState extends State<QuizSubtractionPage> {
  static const int totalQuestions = 5;

  late int a, b, correctAnswer;
  late List<int> options;

  int score = 0;
  int correctCount = 0;
  int questionNumber = 1;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final rand = Random();
    a = rand.nextInt(10) + 1;
    b = rand.nextInt(10) + 1;

    if (b > a) {
      final temp = a;
      a = b;
      b = temp;
    }

    correctAnswer = a - b;

    options = [correctAnswer];
    while (options.length < 3) {
      int fake = correctAnswer + rand.nextInt(5) - 2;
      if (fake != correctAnswer && fake >= 0 && !options.contains(fake)) {
        options.add(fake);
      }
    }
    options.shuffle();
  }

  void showFinalScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: const Text("🎯 Quiz Selesai!"),
            content: Text(
              "Mantap Nak! Kamu telah menyelesaikan $totalQuestions soal!\n\n"
              "Jawaban benar: $correctCount\n"
              "Skor akhir: $score poin\n\n"
              "Terus semangat belajar ya!",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // tutup dialog
                  setState(() {
                    score = 0;
                    correctCount = 0;
                    questionNumber = 1;
                    generateQuestion();
                  });
                },
                child: const Text("Main Lagi"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // tutup dialog
                  Navigator.pop(context); // kembali ke halaman awal
                },
                child: const Text("Keluar"),
              ),
            ],
          ),
    );
  }

  void checkAnswer(int selected) {
    bool isCorrect = selected == correctAnswer;
    if (isCorrect) {
      score += 20;
      correctCount += 1;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            backgroundColor: isCorrect ? Colors.green[100] : Colors.red[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(isCorrect ? "Benar! 🎉" : "Salah 😢"),
            content: Text(
              isCorrect ? "Bagus sekali!" : "Nanti Mamak Marah Yuk coba lagi!",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (questionNumber >= totalQuestions) {
                    showFinalScore();
                  } else {
                    setState(() {
                      questionNumber++;
                      generateQuestion();
                    });
                  }
                },
                child: const Text("Lanjut"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return QuizPageBase(
      title: "Belajar Pengurangan",
      question: "Soal $questionNumber/$totalQuestions:\n$a - $b = ?",
      options: options,
      onOptionSelected: checkAnswer,
    );
  }
}