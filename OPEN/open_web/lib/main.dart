import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    firebaseRegistration();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


