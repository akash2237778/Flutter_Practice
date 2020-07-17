import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:collection';

FirebaseApp app;
DatabaseReference db;

Future<void> fbSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = FirebaseDatabase.instance.reference();
  print(db.reference().child('Organisation/id').key);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    fbSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Attendance System'),
          ),
          body: Container(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance
                      .reference()
                      .child("Organisation/allEmp"),
                  itemBuilder: (_, DataSnapshot snapshot,
                      Animation<double> animation, int x) {
                    Employee n = Employee.fromSnapshot(snapshot);
                    return Card(
                      color: n.temperature > 100 ? Colors.red : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  n.name,
                                  style: TextStyle(fontSize: 25),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.ac_unit,
                                      color: n.temperature > 100
                                          ? Colors.black
                                          : Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(n.temperature.toString() + " F",
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(n.totalHrsWorked.toString() + " hr",
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(n.salary.toString() + "/-",
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.offline_pin,
                              color: n.isWorking ? Colors.green : Colors.red,
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ),
      ),
    );
  }
}

class Employee {
  String name;
  int age;
  String empId;
  dynamic overtimeRate;
  dynamic salaryPerDay; //salary
  //protected Date inTime;
  int inTimeStr;
  // Date outTime;
  int outTimeStr;
  bool isWorking;
  List<dynamic> inTimeList;
  List<dynamic> outTimeList;
  List<dynamic> hrsWorked;
  dynamic temperature;
  int workingHrs;
  int startDay;
  int totalDays;
  int totalHrsWorked;
  int overTimeHrs;
  int salary;
  int daysWorked;
  String key;

  Employee(
      this.name,
      this.age,
      this.empId,
      this.overtimeRate,
      this.salaryPerDay,
      this.inTimeStr,
      this.outTimeStr,
      this.isWorking,
      this.inTimeList,
      this.outTimeList,
      this.hrsWorked,
      this.workingHrs,
      this.startDay,
      this.totalDays,
      this.totalHrsWorked,
      this.overTimeHrs,
      this.salary,
      this.daysWorked,
      this.temperature);

  Employee.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["name"],
        age = snapshot.value["age"],
        empId = snapshot.value["empId"],
        overtimeRate = snapshot.value["overTimeRate"],
        salaryPerDay = snapshot.value["salaryPerDay"],
        inTimeStr = snapshot.value["inTimeStr"],
        outTimeStr = snapshot.value["outTimeStr"],
        isWorking = snapshot.value["isWorking"],
        inTimeList = snapshot.value["inTimeList"],
        outTimeList = snapshot.value["outTimeList"],
        hrsWorked = snapshot.value["hrsWorked"],
        workingHrs = snapshot.value["workingHrs"],
        startDay = snapshot.value["startDay"],
        totalDays = snapshot.value["totalDays"],
        totalHrsWorked = snapshot.value["totalHrsWorked"],
        overTimeHrs = snapshot.value["overTimeHrs"],
        salary = snapshot.value["salary"],
        daysWorked = snapshot.value["daysWorked"],
        temperature = snapshot.value["temperature"];

  toJson() {
    return {
      "name": name,
      "age": age,
      "empId": empId,
      "overTimeRate": overtimeRate,
      "salaryPerDay": salaryPerDay,
      "inTimeStr": inTimeStr,
      "outTimeStr": outTimeStr,
      "isWorking": isWorking,
      "inTimeList": inTimeList,
      "outTimeList": outTimeList,
      "hrsWorked": hrsWorked,
      "workingHrs": workingHrs,
      "startDay": startDay,
      "totalDays": totalDays,
      "totalHrsWorked": totalHrsWorked,
      "overTimeHrs": overTimeHrs,
      "salary": salary,
      "daysWorked": daysWorked,
      "temperature": temperature,
    };
  }
}
