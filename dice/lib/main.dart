import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Dice App'
          ),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceVariable = 1;
  int rightDiceVariable = 1;

  void onClickLeft(){
    setState(() {
      print('Left Button');
      leftDiceVariable=Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex: 2,
              child: FlatButton(
                onPressed: (){
                  onClickLeft();
                },
                child: Image.asset('images/dice$leftDiceVariable.png'),
              )
          ),
          Expanded(
            //flex: 5,
            child: FlatButton(
              onPressed: (){
                setState(() {
                  rightDiceVariable=Random().nextInt(6)+1;
                });
              },
              child: Image(
                image: AssetImage('images/dice$rightDiceVariable.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



