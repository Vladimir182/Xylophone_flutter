import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Widget buildKey({required Color color, required int soundNumber}) {
    return InkWell(
      onTap: () => playSound(soundNumber),
      child: Container(
        height: 10,
        width: double.infinity,
        color: color,
      ),
    );
  }

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              int crossAxisCount = orientation == Orientation.portrait ? 2 : 4;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                children: [
                  buildKey(color: Colors.red, soundNumber: 1),
                  buildKey(color: Colors.orange, soundNumber: 2),
                  buildKey(color: Colors.yellow, soundNumber: 3),
                  buildKey(color: Colors.green, soundNumber: 4),
                  buildKey(color: Colors.teal, soundNumber: 5),
                  buildKey(color: Colors.blue, soundNumber: 6),
                  buildKey(color: Colors.purple, soundNumber: 7),
                  buildKey(color: Colors.pinkAccent, soundNumber: 1),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
