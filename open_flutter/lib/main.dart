import 'dart:async';

import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth/auth.dart';
import './auth/register.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      home: MyHomePage(title: 'Firebase Auth Demo'),
    );
  }
}


/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

*/

TextStyle defaultTextStyle(double size){
  return TextStyle(
    color: Colors.black,
    decoration: TextDecoration.none,
    fontSize: size,
  );
}
/*
class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: SafeArea(
        child: aboutUs(),
      ),
    );
  }

  Container aboutUs(){
    return Container(
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
    );
  }
}*/

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),  (){
      print("Hii");
     // runApp(MaterialApp(home: MyHomePage(title: 'Firebase Auth Demo')));
      runApp(MaterialApp(home: MainNavDrawer(),
          theme: new ThemeData(
             // primaryColor: Color(0XFF212845),
              //scaffoldBackgroundColor: Color(0XFF212845),
              primarySwatch: Colors.yellow,
              buttonColor: Colors.green,
              textTheme:  TextTheme(
                  button: TextStyle(
                      color: Colors.green, // This is not working.
                      //fontSize: 30.0,
                  )
              ))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage('images/logomain.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text('OPEN UPES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text('Aware | Adopt | Contribute',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                      ),),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: const Text('Test SignIn/SignOut'),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}


class MainNavDrawer extends StatefulWidget {
  @override
  _MainNavDrawerState createState() => _MainNavDrawerState();
}

class _MainNavDrawerState extends State<MainNavDrawer> {

  Drawer appToolbar(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.green,
            height: 150,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('images/logomain.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _createDrawerItem(icon: Icons.home,text: 'Home',),
          _createDrawerItem(icon: Icons.photo,text: 'Gallery',),
          _createDrawerItem(icon: Icons.info,text: 'About Us',),
          _createDrawerItem(icon: Icons.remove_red_eye,text: 'Our Vision',),

        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OPEN UPES'),
        backgroundColor: Colors.green,
      ),
      drawer: appToolbar(),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
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
        Column(
          children: <Widget>[
            SizedBox(height: 10,),
              Image.asset('images/logomain.png', height: 150,),
            Text('In association with :',
            style: defaultTextStyle(20),),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10 , top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Image.asset('images/linuxfoundation.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Image.asset('images/ibm.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Image.asset('images/techmint.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Image.asset('images/upes.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Image.asset('images/xebia.png')),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('AWARE | ADOPT | CONTRIBUTE',
              style: defaultTextStyle(25),
              textAlign: TextAlign.center,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: EdgeInsets.all(20),
                child: Text( true ? 'Member Login': 'Know More' , style: TextStyle(fontSize: 20),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
        ],
        ),
      ]
    );
  }

}