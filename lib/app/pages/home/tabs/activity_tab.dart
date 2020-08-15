import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/app/widgets/activity_button.dart';

class ActivityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(Icons.arrow_back),
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 35),
            Text(
              "Start ", 
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            ),
            Text(
              "Activity", 
              style: TextStyle(
                fontSize: 24,
                color: Color(getColorHexFromStr("#5868E0")),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            )    
          ],
        ),
      ),
      child: ListView(
        children: <Widget>[
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityButton(Icons.directions_walk, "Walking"),
                  ActivityButton(Icons.directions_bike, "Tradmill")
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityButton(Icons.directions_run, "Running"),
                  ActivityButton(Icons.directions_bike, "Cycling")
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActivityButton(Icons.store, "Gym"),
                  ActivityButton(Icons.healing, "Yoga")
                ],
              ),
        ],
      ),
      // child: SingleChildScrollView(
      //   child: Container(
      //     color: Color(getColorHexFromStr("#EFF3FF")),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
              // Container(
              //   padding: EdgeInsets.only(top: 30, bottom: 30, left: 20),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Icon(Icons.arrow_back),
                //     SizedBox(width: 30),
                //     Text(
                //       "Start ", 
                //       style: TextStyle(
                //         fontSize: 26,
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         decoration: TextDecoration.none
                //       ),
                //     ),
                //     Text(
                //       "Activity", 
                //       style: TextStyle(
                //         fontSize: 26,
                //         color: Color(getColorHexFromStr("#5868E0")),
                //         fontWeight: FontWeight.bold,
                //         decoration: TextDecoration.none
                //       ),
                //     )    
                //   ],
                // ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ActivityButton(Icons.directions_walk, "Walking"),
              //     ActivityButton(Icons.directions_bike, "Tradmill")
              //   ],
              // ),
              // SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ActivityButton(Icons.directions_run, "Running"),
              //     ActivityButton(Icons.directions_bike, "Cycling")
              //   ],
              // ),
              // SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ActivityButton(Icons.store, "Gym"),
              //     ActivityButton(Icons.healing, "Yoga")
              //   ],
              // ),
      //         SizedBox(height: 20)
      //       ],
      //     ),
      //   ),
      // )
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