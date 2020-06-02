import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase.dart';
import 'package:http/http.dart' as http;


import 'package:firebase_database/firebase_database.dart';

bool _success;

void main() {
  runApp(MyApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> firebaseRegistration() async {
  final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
  email: 'b@gmail.com',
  password: 'Passwd',
  ))
  .user;
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
  final TextEditingController _nameController = TextEditingController();
  String _userEmail;

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          body: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email', hintText: "e.g abc@gmail.com",),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter Email !';
                      }
                      String text;
                      EmailValidator.validate(value)? text = null: text= 'Invalid Email address';
                      return text;
                    },
                  ),

                  TextFormField(
                    controller: _gitController,
                    decoration: const InputDecoration(labelText: 'Github Username'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter Github Username';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password', hintText: '1 Upper case, 1 lowercase, 1 Numeric Number, 1 Special Character' ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                      String txt;
                      validateStructure(value)? txt = null: txt='Weak Password';
                      return txt;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _repasswordController,
                    decoration: const InputDecoration(labelText: 'Re-Enter Password', ),
                    validator: (String value) {
                      if (value != _passwordController.text) {
                        return 'Password are not same';
                      }
                      return null;
                    },
                  ),
                  Container(
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
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null
                        ? ''
                        : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
                  )
                ],
              ),
            ),
          )
      ),
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

        fetchAlbum(_nameController.text, _emailController.text , _gitController.text , '15-12-2000');

        user.updateProfile(userUpdateInfo);
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }


  Future<void> fetchAlbum(String name , String email , String git , String dob) async {

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
    var url = "http://18.197.247.183/cgi-bin/userInfo.py?fname=" + nameArr[0] + "&lname=" + nameArr[1] +"&email1=" + emailArr[0]+"&email2=" + emailArr[1]+ "&email3=" + emailArr[2]+"&git="+ git+"&dob=" + dob;

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
      print(e);
    }

  }
}




