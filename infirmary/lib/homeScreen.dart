import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/FirestoreService.dart';
import 'package:infirmary/Drawer.dart';
import 'package:infirmary/UrlLancher.dart';
import 'HomeOperations/Emergency.dart';
import 'HomeOperations/EmergencyContacts.dart';
import 'homeButtons.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  QuerySnapshot userData;
  bool isOpen = false;
  int traffic = 0;



    void getData()async{

      QuerySnapshot temp;
      await DatabaseMethods().getStream('InfirmaryInfo').then((snapshots) {

        temp = snapshots;

      });
      setState(() {
        isOpen = temp.documents[0].data['isOpen'];
        traffic = temp.documents[0].data['traffic'];
      });
  }


  @override
  Widget build(BuildContext context) {
      getData();
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.087),
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: new RawMaterialButton(
              fillColor: Colors.black,
              shape: new CircleBorder(),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 25,
                  child: Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              onPressed: (){
                launchURL('tel://8882237778');
              },
            ),
        ),
      ),
      appBar: appBar(),
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
                flex: 2,
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
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyContacts()));
                                },
                                child: buttonPannel(
                                    icon: Icons.contact_mail,
                                    color: Colors.blue[600],
                                    iconText: 'Emergency Contacts'),
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Emergency()));
                                  },
                                  child: buttonPannel(
                                      icon: Icons.local_hospital,
                                      color: Colors.red,
                                      iconText: 'Emergency'),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: buttonPannel(
                                    icon: Icons.library_books,
                                    iconText: 'First Aid')),
                            Expanded(
                                child: buttonPannel(
                                    icon: Icons.open_in_browser,
                                    color: isOpen ? Colors.green[400] : Colors.black,
                                    iconText: 'Infirmary Status')),
                            Expanded(
                                child: buttonPannel(
                                    icon: Icons.people,
                                    iconText: 'Live Traffic',
                                traffic: traffic.toString())),
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
