import 'dart:async';

import 'package:flutter/material.dart';

import 'main.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    print("Hii");
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: Image(
                    image: AssetImage('images/doctor.png'),
                  ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          home_screen_button('Button1')
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Expanded home_screen_button(String buttonText){
  return Expanded(
      child: FlatButton(
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Text(buttonText,),
        ),
      ),
  );
}