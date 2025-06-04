import 'package:flutter/material.dart';

class ShapesPage extends StatefulWidget {
  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  int currentIndex = 0;

  final List<Map<String, String>> shapes = [
    {'name': 'Circle', 'image': 'circle.png'},
    {'name': 'Square', 'image': 'square.png'},
    {'name': 'Triangle', 'image': 'triangle.png'},
    {'name': 'Rectangle', 'image': 'rectangle.png'},
    {'name': 'Star', 'image': 'star.png'},
    {'name': 'Heart', 'image': 'heart.png'},
  ];

  void _nextShape() {
    if (currentIndex < shapes.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _prevShape() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentShape = shapes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Shapes'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[100],
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentShape['name']!,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/images/shapes/${currentShape['image']}',
              height: 200,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _prevShape,
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: _nextShape,
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
