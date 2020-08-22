import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infirmary/Drawer.dart';
import 'homeButtons.dart';
import 'main.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infirmary'),
        backgroundColor: Colors.orange,
      ),
      drawer: appDrawer(context),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/doctor.png'),
                        ),
                      ],
                    ),
                  ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: buttonPannel(iconImage: AssetImage('images/google_logo.png')  , iconText: 'Find a Doctor')),
                            Expanded(child: buttonPannel(icon: Icons.date_range , iconText: 'Appointments')),
                          ],
                          ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                            Expanded(child: buttonPannel(icon: Icons.local_pharmacy , iconText: 'Find a Doctor')),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              bottomPannel(),
            ],
          ),
        ),
      ),
    );
  }
}
