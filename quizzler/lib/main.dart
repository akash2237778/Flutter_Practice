import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:easy_alert/easy_alert.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Widget> score = [Text(
    'Score :',
    style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal
    ),
  )
  ];
  QuestionBank obj = QuestionBank();
  bool gameOn = true;

  void onClick(bool userAnswer, BuildContext c) {
    setState(() {
      bool answer = obj.getAnswer();
      gameOn = obj.nextQuestion();
      if (gameOn) {
        if (userAnswer == answer) {
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }
      }
      else {
        testAlert(context);
      }
      print(obj.i);
      print(gameOn);

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    obj.getQuestion(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        decoration: TextDecoration.none
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  child: FlatButton(
                    onPressed: () {
                      onClick(true, context);
                    },
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.red,
                  child: FlatButton(
                    onPressed: () {
                      onClick(false, context);
                    },
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: score,
              )
            ],
          ),
        ),
      ),
    );
  }

  void testAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Quiz Finished !!",
      desc: "Want to play again ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
              score.removeRange(1, obj.getLength());
              obj.i = 0;
            });

          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
}
