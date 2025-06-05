import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ShapesPage extends StatefulWidget {
  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  int currentIndex = 0;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> shapes = [
    {'name': 'Circle', 'image': 'circle.png', 'sound': 'circle.mp3'},
    {'name': 'Square', 'image': 'square.png', 'sound': 'square.mp3'},
    {'name': 'Triangle', 'image': 'triangle.png', 'sound': 'triangle.mp3'},
    {'name': 'Rectangle', 'image': 'rectangle.png', 'sound': 'rectangle.mp3'},
    {'name': 'Star', 'image': 'star.png', 'sound': 'star.mp3'},
    {'name': 'Heart', 'image': 'heart.png', 'sound': 'heart.mp3'},
  ];

  void _playSound(String fileName) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource('sounds/shapes/$fileName'));
  }

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
            SizedBox(height: 16),
            Image.asset(
              'assets/images/shapes/${currentShape['image']}',
              height: 200,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.volume_up),
              label: Text('Play Sound'),
              onPressed: () => _playSound(currentShape['sound']!),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 24),
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
