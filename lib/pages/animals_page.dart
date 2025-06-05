import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalsPage extends StatefulWidget {
  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  int currentIndex = 0;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> animals = [
    {'name': 'Cat', 'image': 'cat.png', 'sound': 'cat.mp3'},
    {'name': 'Dog', 'image': 'dog.png', 'sound': 'dog.mp3'},
    {'name': 'Elephant', 'image': 'elephant.png', 'sound': 'elephant.mp3'},
    {'name': 'Lion', 'image': 'lion.png', 'sound': 'lion.mp3'},
    {'name': 'Monkey', 'image': 'monkey.png', 'sound': 'monkey.mp3'},
    {'name': 'Rabbit', 'image': 'rabbit.png', 'sound': 'rabbit.mp3'},
    {'name': 'Duck', 'image': 'duck.png', 'sound': 'duck.mp3'},
  ];

  void _playSound(String fileName) async {
    await audioPlayer.stop(); // Stop if playing
    await audioPlayer.play(AssetSource('sounds/animals/$fileName'));
  }

  void _nextAnimal() {
    if (currentIndex < animals.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _prevAnimal() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentAnimal = animals[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Animals'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.orange[100],
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentAnimal['name']!,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Image.asset(
              'assets/images/animals/${currentAnimal['image']}',
              height: 200,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _playSound(currentAnimal['sound']!),
              icon: Icon(Icons.volume_up),
              label: Text("Play Sound"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _prevAnimal,
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: _nextAnimal,
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
