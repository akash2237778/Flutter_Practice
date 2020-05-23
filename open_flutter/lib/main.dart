import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

TextStyle defaultTextStyle(double size){
  return TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: size,
  );
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: SafeArea(
        child: Container(
            margin: EdgeInsets.all(0),
            color: Colors.grey[200],
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                      height: 200.0,
                      child: Carousel(
                        images: [
                          Image(
                            image: NetworkImage('https://www.upesopen.org/b.png'),
                            fit: BoxFit.fill,
                          ),
                          NetworkImage('https://www.upesopen.org/b.png'),
                          NetworkImage('https://www.upesopen.org/b.png'),
                          NetworkImage('https://www.upesopen.org/b.png'),
                          // ExactAssetImage("assets/images/LaunchImage.jpg")
                        ],
                        dotSize: 4.0,
                        dotSpacing: 15.0,
                        dotColor: Colors.lightGreenAccent,
                        indicatorBgPadding: 5.0,
                        dotBgColor: Colors.purple.withOpacity(0.0),
                        borderRadius: true,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                      )
                  ),
                ),


                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Text('Aware',
                          style: defaultTextStyle(45),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('https://www.upesopen.org/img/educate.png'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 200,
                          child: Text('We aim at spreading awareness about the advantages of using Open source softwares over conventional proprietary softwares.',
                            textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(7),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Text('Adopt',
                          style: defaultTextStyle(45),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('https://www.upesopen.org/img/adopt.png'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 200,
                          child: Text('Spreading awareness is futile until and unless we motivate people to adopt the prevailing open source softwares in their work environment.',
                            textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(7),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Text('Contribute',
                          style: defaultTextStyle(45),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('https://www.upesopen.org/img/contribute.png'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 200,
                          child: Text('The whole concept of open source revolves around community which uses it and contributing to the community is always a matter of prestige.',
                            textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(7),
                ),
              ],
            )
        ),
      ),
    );
  }
}

