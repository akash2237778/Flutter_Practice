import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/HomeOperations/ContactCard.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            contactCard(),
          ],
        ),
      ),
    );
  }
}


