import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/AuthService.dart';

import 'main.dart';



Drawer appDrawer(BuildContext context){
  return Drawer(
    child: Scaffold(
      appBar: appBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
              ),
              SizedBox(height: 10,),
              Text(user.displayName , style: TextStyle(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(user.email , style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              user.phoneNumber != null ? Text(user.phoneNumber , style: TextStyle(color: Colors.white),) : Container(),
              Spacer(),
              GestureDetector(
                onTap: (){
                  AuthService().signOut(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Text('Log Out', style: TextStyle(fontSize: 15),),
                ),
              ),
              SizedBox(height: 10,)
             ],
          ),
        ),
      ),
    ),
  );
}