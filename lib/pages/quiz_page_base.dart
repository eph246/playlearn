import 'package:flutter/material.dart';

class QuizPageBase extends StatelessWidget {
  final String title;
  final String question;
  final List<int> options;
  final void Function(int) onOptionSelected;

  const QuizPageBase({
    super.key,
    required this.title,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 4,
        title: Row(
          children: [
            const Icon(Icons.school, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Gambar kuis anak-anak (dengan fallback)
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    'assets/images/kid_quiz.png',
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(
                          Icons.image_not_supported,
                          size: 100,
                          color: Colors.grey,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                // Pertanyaan
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Opsi jawaban
                ...options.map(
                  (opt) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () => onOptionSelected(opt),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                            size: 32,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "$opt",
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}