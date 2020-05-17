import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}
class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {

    soundPlay(int noteNo){
      final audio = AudioCache();
      audio.play('note$noteNo.wav');
    }

    Widget buildKey(int playNote, Color barColor){
      return Expanded(
        child: FlatButton(
          onPressed: (){
            soundPlay(playNote);
          },
          padding: EdgeInsets.all(0),
          child: Container(
            color: barColor,
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        buildKey(1, Colors.red),
        buildKey(2,Colors.orange),
        buildKey(3, Colors.yellow),
        buildKey(4, Colors.lime),
        buildKey(5, Colors.green),
        buildKey(6, Colors.cyan),
        buildKey(7, Colors.blue),
      ],
    );
  }
}
