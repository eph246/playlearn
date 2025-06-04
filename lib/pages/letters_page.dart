import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LettersPage extends StatefulWidget {
  @override
  _LettersPageState createState() => _LettersPageState();
}

class _LettersPageState extends State<LettersPage> {
  int currentIndex = 0;
  final List<String> letters = List.generate(26, (index) => String.fromCharCode(65 + index));
  final AudioPlayer audioPlayer = AudioPlayer();

  void _playSound(String letter) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource('sounds/letters/$letter.mp3'));
  }

  void _nextLetter() {
    if (currentIndex < letters.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _prevLetter() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    String letter = letters[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Letters'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow[100],
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              letter,
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/letters/$letter.png',
              height: 200,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.volume_up),
              label: Text('Play Sound'),
              onPressed: () => _playSound(letter),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _prevLetter,
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: _nextLetter,
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
