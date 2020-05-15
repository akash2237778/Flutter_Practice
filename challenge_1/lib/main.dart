import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Text("Container1"),
            ),
              Container(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text('R2 C1'),
                      color: Colors.white,
                      width: double.infinity,
                      height: 100,
                    ),
                    Container(
                      child: Text('R2 C2'),
                      color: Colors.green,
                      width: double.infinity,
                      height: 100,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                color: Colors.lime,
                child: Text("Container 2"),
              ),
            ],
          ),

//Flutter Layout Cheat Sheat / Flutter Community
        /*  Container(
            height: 100.0,
            width: 100,
            margin: EdgeInsets.fromLTRB(10, 10, 20, 15),
            padding: EdgeInsets.all(20),
            //margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            color: Colors.red,
            child: Text('Hello World'),
          ),*/
        ),
      ),
    );
  }
}
