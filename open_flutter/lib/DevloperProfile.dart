import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class DeveloperInfo extends StatefulWidget {
  @override
  _DeveloperInfoState createState() => _DeveloperInfoState();
}

class _DeveloperInfoState extends State<DeveloperInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(160, 204, 57, 2),
        body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/akash.jpeg'),
                        ),
                        Text(
                          'Akash Saini',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IndieFlower',
                          ),
                        ),
                        Text(
                          'DevOps Enthusiast',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 2.5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 150,
                          child: Divider(
                            color: Colors.teal.shade100,
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(left: 40 , right: 40 ,  top: 10 , bottom: 5),
                          onPressed: (){
                            _launchURL('tel:+918882237778');
                          },
                          child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                    Icons.phone
                                ),
                                title: Text('+91 888 223 7778'),
                              )
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.only(left: 40 , right: 40 ,  top: 5 , bottom: 10),
                          onPressed: (){
                            _launchURL('mailto:akash2237778@gmail.com');
                          },
                          child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                    Icons.email
                                ),
                                title: Text('akash2237778@gmail.com'),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            _launchURL('https://www.linkedin.com/in/akash-saini-ak7778/');
                          },
                          child: Image(
                            image: AssetImage('images/linkedin.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            _launchURL('https://github.com/akash2237778');
                          },
                          child: Image(
                            image: AssetImage('images/github.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        FlatButton(
                          onPressed: (){
                            _launchURL('https://www.instagram.com/akash_saini7778/');
                          },
                          child: Image(
                            image: AssetImage('images/instagram.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


