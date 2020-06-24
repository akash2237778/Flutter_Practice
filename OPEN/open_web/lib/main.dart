import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_apps/device_apps.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:http/http.dart' as http;
import 'package:android_intent/android_intent.dart';
import 'package:flutter/foundation.dart' show kIsWeb;




import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

bool _success;

void main() {
  runApp(MainApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;


class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/redirect': (BuildContext context) => redirectPage(),
      },
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //firebaseRegistration();


  }



  final formKey = GlobalKey<FormState>();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _gitController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String _userEmail;

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*0.7 > 500 ? 500 : MediaQuery.of(context).size.width*0.7 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(labelText: 'Name',
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(labelText: 'Email', hintText: "e.g abc@gmail.com",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter Email !';
                                }
                                String text;
                                EmailValidator.validate(value)? text = null: text= 'Invalid Email address';
                                return text;
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              controller: _gitController,
                              decoration: InputDecoration(labelText: 'Github Username',
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              validator: (String value) {
                                if(value.contains('@')){
                                  return 'type only username';
                                }
                                if (value.isEmpty) {
                                  return 'Please enter Github Username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                             controller: _dobController,
                              decoration: InputDecoration(labelText: 'Date of Birth (DD/MM/YYYY)', hintText: 'e.g. 15/12/2000',
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              validator: (String value) {
                                if(!value.contains('/')){
                                  return 'Add / in format DD/MM/YYYY';
                                }
                                if (value.contains('/',2) && value.contains('/',5) && value.length == 10) {
                                  return null;
                                }
                                return 'Invalid date format';
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              decoration: InputDecoration(labelText: 'Password', hintText: '1 Upper case, 1 lowercase, 1 Numeric Number, 1 Special Character',
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                String txt;
                                validateStructure(value)? txt = null: txt='Weak Password';
                                return txt;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              obscureText: true,
                              controller: _repasswordController,
                              decoration: InputDecoration(labelText: 'Re-Enter Password',
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                              ),
                              validator: (String value) {
                                if (value != _passwordController.text) {
                                  return 'Password are not same';
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              alignment: Alignment.center,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _register();
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(_success == null
                                ? ''
                                : (_success
                                ? 'Successfully registered ' + _userEmail
                                : 'Registration failed')),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      );

  }


  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {

        UserUpdateInfo userUpdateInfo = UserUpdateInfo();
        userUpdateInfo.displayName = _nameController.text;

        fetchAlbum(_nameController.text, _emailController.text , _gitController.text , _dobController.text);

        user.updateProfile(userUpdateInfo);
        _userEmail = user.email;

      });
    } else {
      _success = false;
    }
  }


  Future<void> fetchAlbum(String name , String email , String git , String dob) async {
    var url;
    //final response = await http.get(Uri.encodeFull("http://18.197.247.183/cgi-bin/userInfo.py?name=" + name + "&email=" + email+ "&git="+ git+"&dob=" + dob));
    var nameArr = new List(3);
    if(name.contains(' ')){
      nameArr[0] = name.split(' ')[0];
      nameArr[1] = name.split(' ')[1];
    }
    else{
      nameArr[0] = name;
    }
    var emailArr = new List(3);
    emailArr[0] = email.split('@')[0];
    emailArr[1] = email.split('@')[1].split('.')[0];
    emailArr[2] = email.split('@')[1].split('.')[1];

    if(name.contains(' ')) {
      url = "http://18.197.247.183/cgi-bin/userInfo.py?fname=" + nameArr[0] +
          "&lname=" + nameArr[1] + "&email1=" + emailArr[0] + "&email2=" +
          emailArr[1] + "&email3=" + emailArr[2] + "&git=" + git + "&dob=" +
          dob;
    }
    else{
      url = "http://18.197.247.183/cgi-bin/userInfo.py?fname=" + nameArr[0] +
           "&email1=" + emailArr[0] + "&email2=" +
          emailArr[1] + "&email3=" + emailArr[2] + "&git=" + git + "&dob=" +
          dob;
    }
    print(url);
    try {
      var response = await http.post(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    catch(e){
      if(e.toString().contains('XMLHttpRequest error')) {
        print('Done');
        setState(() {
          _success = true;
         });
      }
      else{
        setState(() {
          _success = false;
        });
      }
      if(_success){
        Navigator.pushNamed(context, '/redirect' );
      }
      print(e);
    }


  }
}


_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class redirectPage extends StatefulWidget {
  @override
  _redirectPageState createState() => _redirectPageState();
}

class _redirectPageState extends State<redirectPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    //if(Device.get().isAndroid){
   // _openJioSavaan('JioSavaan');
   // }
  //  else{
     _launchURL('https://www.upesopen.org/');
    //}
  }

  _openJioSavaan (data) async
  {String dt = data['JioSavaan'] as String;
  bool isInstalled = await DeviceApps.isAppInstalled('com.jio.media.jiobeats');
  if (isInstalled != false)
  {
    AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: dt
    );
    await intent.launch();
  }
  else
  {
    String url = dt;
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Registered Successfully, open to andriod App to login !'),
              ],
            ),
          ),
        ),
      );
  }
}





