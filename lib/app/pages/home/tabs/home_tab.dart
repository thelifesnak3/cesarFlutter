import 'package:flutter/material.dart';
import 'package:workout_app/app/widgets/home_box.dart';
import 'package:workout_app/app/widgets/home_daily_button.dart';
import 'package:workout_app/app/widgets/home_todays_button.dart';

class HomeTab extends StatelessWidget {

  HomeTab(this.email);

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
        color: Color(getColorHexFromStr("#EFF3FF")),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello $email!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Find A ",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        decoration: TextDecoration.none
                      ),
                    ),
                    Text(
                      "Workout",
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(getColorHexFromStr("#5868E0")),
                        decoration: TextDecoration.none
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            HomeBox(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Activity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(getColorHexFromStr("#6782E6")),
                        decoration: TextDecoration.none
                      ),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeTodaysButton(Icons.directions_walk, "STEPS", "1,228"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeTodaysButton(Icons.offline_bolt, "CALORIES", "829"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeTodaysButton(Icons.favorite, "BPM", "88,9")
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Daily Activity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(getColorHexFromStr("#6782E6")),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("08", "MON"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("07", "SUN"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("06", "SAT"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("05", "FRI"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("04", "THU"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("03", "WED"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: HomeDailyButton("02", "TUE"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      )
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