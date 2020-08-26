import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/HomeOperations/ContactCard.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {

  Stream userStream;


  makeStream()async{
   // await DatabaseMethods().getStream('EmergencyContacts/Contact1').then((snapshots) {
       //   userStream = snapshots;

        print("we got the data + ${userStream.toString()} this is name ");
  //  });
  }


  @override
  Widget build(BuildContext context) {


    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            StreamBuilder(
             // stream: userStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return contactCard();
                  },
                ): Container();
              }),
          ],
        ),
      ),
    );
  }
}


