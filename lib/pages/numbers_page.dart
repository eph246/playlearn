import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NumbersPage extends StatefulWidget {
  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  int currentIndex = 0;
  final List<int> numbers = List.generate(10, (index) => index + 1);
  final AudioPlayer audioPlayer = AudioPlayer();

  void _playSound(int number) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource('sounds/numbers/$number.mp3'));
  }

  void _nextNumber() {
    if (currentIndex < numbers.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _prevNumber() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    int number = numbers[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Numbers'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightGreen[100],
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$number',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/numbers/$number.png',
              height: 200,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.volume_up),
              label: Text('Play Sound'),
              onPressed: () => _playSound(number),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _prevNumber,
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: _nextNumber,
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
