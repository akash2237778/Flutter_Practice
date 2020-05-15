import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Main is starting point for all apps
// 1) MaterialApp -> Center -> Text
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am Rich'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/wp2741158.jpg'),
         // image: NetworkImage('https://wallpapercave.com/wp/wp2741158.jpg'),
        ),
        ),
        backgroundColor: Colors.black12,
      ),
    ),
  );
}
