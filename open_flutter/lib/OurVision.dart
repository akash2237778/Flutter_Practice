import 'main.dart';
import 'package:flutter/material.dart';

class OurVision extends StatefulWidget {
  String rtName = '/ourVision';
  @override
  _OurVisionState createState() => _OurVisionState();
}

class _OurVisionState extends State<OurVision> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: bodyWidget(),
        drawer: appToolbar(context),
        appBar: AppBar(
          title: Text('Our Vision'),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Widget bodyWidget(){
    return ListView(
      children: <Widget>[
        carouselImg('https://www.upesopen.org/img/mission.png'),
        Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20 , right: 20),
                height: 1,
                color: Colors.grey,
              ),

              Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  'Shaping the future of Academia & Industry with Open Source practices.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  'Vision',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.topLeft,
                child: Text(
                  'To promote and protect Open Source Software. \nTo enrich the Education sector with innovative ideas.\nTo provide solutions for the betterment of society.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Text(
                  'Values',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.topLeft,
                child: Text(
                  'To educate the nation about open source development with various technical activities.\nTo provide a platform that minimizes the gap between academy and industry.\nTo enhance extraneous growth of the country through Open Source technologies.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
