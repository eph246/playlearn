import 'package:flutter/material.dart';
import 'letters_page.dart';
import 'numbers_page.dart';
import 'shapes_page.dart';
import 'colors_page.dart';
import 'animals_page.dart';
import 'math_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {'title': 'Letters', 'icon': Icons.abc, 'color': Colors.pinkAccent},
    {'title': 'Numbers', 'icon': Icons.pin, 'color': Colors.blueAccent},
    {'title': 'Shapes', 'icon': Icons.category, 'color': Colors.orange},
    {'title': 'Colors', 'icon': Icons.palette, 'color': Colors.green},
    {'title': 'Animals', 'icon': Icons.pets, 'color': Colors.deepPurple},
    {'title': 'Math', 'icon': Icons.calculate, 'color': Colors.redAccent},
  ];

  void _navigateToPage(BuildContext context, String title) {
    Widget page;
    switch (title) {
      case 'Letters':
        page = LettersPage();
        break;
      case 'Numbers':
        page = NumbersPage();
        break;
      case 'Shapes':
        page = ShapesPage();
        break;
      case 'Colors':
        page = ColorsPage();
        break;
      case 'Animals':
        page = AnimalsPage();
        break;
      case 'Math':
        page = MathHomePage();
        break;
      default:
        page = LettersPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'PlayLearn',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent, // 🎨 Tambahkan warna cerah
        elevation: 6,
        shadowColor: Colors.pinkAccent.withOpacity(0.4), // 🌤️ Tambahkan bayangan
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFAFFD1), Color(0xFFFFA69E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => _navigateToPage(context, item['title']),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: item['color'].withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 60, color: Colors.white),
                    const SizedBox(height: 12),
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
