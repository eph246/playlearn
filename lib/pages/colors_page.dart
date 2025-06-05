import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ColorsPage extends StatefulWidget {
@override
_ColorsPageState createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
final List<Map<String, dynamic>> colorsList = [
{'name': 'Red', 'color': Colors.red, 'image': 'red.png', 'sound': 'red.mp3'},
{'name': 'Green', 'color': Colors.green, 'image': 'green.png', 'sound': 'green.mp3'},
{'name': 'Yellow', 'color': Colors.yellow, 'image': 'yellow.png', 'sound': 'yellow.mp3'},
{'name': 'Orange', 'color': Colors.orange, 'image': 'orange.png', 'sound': 'orange.mp3'},
{'name': 'pink', 'color': const Color.fromARGB(255, 255, 45, 171), 'image': 'pink.png', 'sound': 'pink.mp3'},
];

int currentIndex = 0;
final AudioPlayer audioPlayer = AudioPlayer();

void _playSound(String fileName) async {
await audioPlayer.stop();
await audioPlayer.play(AssetSource('sounds/colors/$fileName'));
}

void _next() {
if (currentIndex < colorsList.length - 1) {
setState(() => currentIndex++);
}
}

void _prev() {
if (currentIndex > 0) {
setState(() => currentIndex--);
}
}

@override
Widget build(BuildContext context) {
final currentColor = colorsList[currentIndex];


return Scaffold(
  appBar: AppBar(
    title: Text('Learn Colors'),
    centerTitle: true,
    backgroundColor: currentColor['color'],
  ),
  body: Container(
    color: currentColor['color'].withOpacity(0.2),
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentColor['name'],
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: currentColor['color']),
        ),
        SizedBox(height: 16),
        Image.asset('assets/images/colors/${currentColor['image']}', height: 200),
        SizedBox(height: 16),
        ElevatedButton.icon(
          icon: Icon(Icons.volume_up),
          label: Text('Play Sound'),
          onPressed: () => _playSound(currentColor['sound']),
          style: ElevatedButton.styleFrom(backgroundColor: currentColor['color']),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _prev,
              child: Icon(Icons.arrow_back),
            ),
            ElevatedButton(
              onPressed: _next,
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
