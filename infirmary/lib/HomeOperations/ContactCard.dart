import 'package:flutter/material.dart';

import '../UrlLancher.dart';


Card contactCard(){
  return Card(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr. ABCD', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Text('One-liner', style: TextStyle(),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Availability :', style: TextStyle(fontSize: 10),),
                    Icon(Icons.check_circle, size: 15, color: Colors.green,)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                launchURL('tel://8882237778');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.phone, size: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}