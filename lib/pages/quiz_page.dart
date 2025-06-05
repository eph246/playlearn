import 'dart:math';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final bool isAddition;
  const QuizPage({super.key, required this.isAddition});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  late int a, b, correctAnswer;
  late List<int> options;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    generateQuestion();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void generateQuestion() {
    final rand = Random();
    a = rand.nextInt(10) + 1;
    b = rand.nextInt(10) + 1;

    if (!widget.isAddition && b > a) {
      int temp = a;
      a = b;
      b = temp;
    }

    correctAnswer = widget.isAddition ? a + b : a - b;

    options = [correctAnswer];
    while (options.length < 3) {
      int fake = correctAnswer + rand.nextInt(5) - 2;
      if (fake != correctAnswer && fake >= 0 && !options.contains(fake)) {
        options.add(fake);
      }
    }
    options.shuffle();
  }

  void checkAnswer(int selected) {
    bool isCorrect = selected == correctAnswer;

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: isCorrect ? Colors.green[100] : Colors.red[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(
                  isCorrect ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 32,
                ),
                const SizedBox(width: 10),
                Text(isCorrect ? "Benar!" : "Ups, Salah"),
              ],
            ),
            content: Text(
              isCorrect
                  ? "Bagus sekali! Kamu hebat!"
                  : "Coba lagi ya, pasti bisa!",
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    generateQuestion();
                    _controller.forward(from: 0.0);
                  });
                },
                child: const Text("Lanjut", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          widget.isAddition ? "Belajar Penjumlahan" : "Belajar Pengurangan",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ScaleTransition(
              scale: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "$a ${widget.isAddition ? "+" : "-"} $b = ?",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ...options.map(
                    (opt) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 40,
                          ),
                          elevation: 5,
                        ),
                        onPressed: () => checkAnswer(opt),
                        child: Text(
                          "$opt",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}