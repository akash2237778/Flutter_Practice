import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Map.dart';
import 'package:infirmary/UrlLancher.dart';
import 'package:infirmary/main.dart';
import 'package:location/location.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

import '../HelperFunctions.dart';
import '../Location.dart';

var controller = MapController(
  location: LatLng(0, 0),
);

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  bool isLoading = false;
  LocationData locationData;

  void control() async {
    locationData = await Locate();

    setState(() {
      controller = MapController(
          location: LatLng(locationData.latitude, locationData.longitude));
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    control();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                            r"^\d{10}$")
                            .hasMatch(val)
                            ? null
                            : "Please enter correct number";
                      },
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("Phone number"),
                      controller: phoneEditingController,
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.length > 0
                            ? null
                            : "Description";
                      },
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("Description"),
                      controller: textEditingController,
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Lat :' +
                                  (locationData != null
                                      ? locationData.latitude.toString()
                                      : ''),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Long :' +
                                  (locationData != null
                                      ? locationData.longitude.toString()
                                      : ''),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width*0.8,
                          child: Card(
                            child: isLoading
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.orange,
                                      strokeWidth: 8,
                                    ))
                                : plotMap(controller),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: (){
                      if(formKey.currentState.validate()){

                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Send Alert !', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: (){
                      launchURL('tel://8882237778');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
