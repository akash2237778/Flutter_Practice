import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/FirestoreService.dart';
import 'package:infirmary/HomeOperations/ContactCard.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {

  QuerySnapshot userStream;


  makeStream()async{
    QuerySnapshot temp;
    await DatabaseMethods().getStream('EmergencyContacts').then((snapshots) {

        temp = snapshots;

         });
    setState(() {
      userStream = temp;
    });
    print("we got the data + ${userStream.documents[0].data['Name']} this is name ");

  }


  @override
  Widget build(BuildContext context) {
makeStream();

    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            userStream != null ? ListView.builder(
                  itemCount: userStream.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return contactCard(name: userStream.documents[index].data['Name'], line: userStream.documents[index].data['About'], isAvailable: userStream.documents[index].data['Availability'] , number: userStream.documents[index].data['Pnumber'].toString());
                  },
                ): Container(),

          ],
        ),
      ),
    );
  }
}


