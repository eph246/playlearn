import 'package:flutter/material.dart';
import './pages/letters_page.dart';

void main() {
  runApp(EduKidsApp());
}

class EduKidsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduKids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Letters', 'icon': Icons.abc, 'color': Colors.pink, },
    {'title': 'Numbers', 'icon': Icons.confirmation_number, 'color': Colors.orange},
    {'title': 'Shapes', 'icon': Icons.category, 'color': Colors.green},
    {'title': 'Colors', 'icon': Icons.color_lens, 'color': Colors.blue},
    {'title': 'Animals', 'icon': Icons.pets, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('EduKids Home'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: menuItems.map((item) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: item['color'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LettersPage()),
              );
              // TODO: Tambahkan navigasi ke halaman masing-masing
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 48, color: Colors.white),
                SizedBox(height: 12),
                Text(
                  item['title'],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
