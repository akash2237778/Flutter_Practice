import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class DatabaseMethods{
  getStream(String path)async {
    return await Firestore.instance
        .collection(path)
        .getDocuments();
  }
}