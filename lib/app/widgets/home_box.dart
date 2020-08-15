import 'dart:async';

import 'package:flutter/material.dart';

class HomeBox extends StatefulWidget {
  @override
  _HomeBoxState createState() => _HomeBoxState();
}

class _HomeBoxState extends State<HomeBox> {

  Timer _timer;
  int _count = 0;
  bool _off = true;
  String textButton = "Start Workout";

  void startTimer() {
    if(_count == 0) {
      setState(() {
        textButton = "Stop Workout";
        _off = false;
      });
    } else {
      setState(() {
        textButton = "Start Workout";
        _count = 0;
        _off = true;
      });
    }
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if(_off) {
            timer.cancel();
          } else {
            _count += 1;
          }
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(getColorHexFromStr("#474BD9")),
                Color(getColorHexFromStr("#6B88E8"))
              ]
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 140),
                  Text(
                    "Legs",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  ),
                  Text(
                    " and",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 140),
                  Text(
                    "Glutes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  ),
                  Text(
                    " workout",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 140),
                  Icon(
                    Icons.line_weight,
                    color: Colors.white,
                    size: 10,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Advanced",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 140),
                  Icon(
                    Icons.watch_later,
                    color: Colors.white,
                    size: 10,
                  ),
                  SizedBox(width: 5),
                  Text(
                    _count.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 140),
                  RaisedButton(
                    onPressed: () { startTimer(); },
                    child: Text(textButton),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                    ),
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 100,
          child: Container(
            height: 230,
            width: 230,
            child: Image.asset("assets/images/woman_workout.png"),
          ),
        )
      ],
    );
  }
}

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}