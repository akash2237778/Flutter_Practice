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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/i_am_rich_app_icon.png'),
              ),
              Text(
                'Akash Saini',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IndieFlower',
                ),
              ),
              Text(
                'DevOps Enthusiast',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+91 88822 37778'
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 40),
                child: ListTile(
                    leading: Icon(
                      Icons.email
                    ),
                    title: Text('akash2237778@gmail.com'),
                  )
                ),
            ],
          )
        ),
      ),
    );
  }
}
//www.materialpalettee.com

/*
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                          Icons.email
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          'akash2237778@gmail.com'
                      )
                    ],
                  ),
                ),
              ),
* */