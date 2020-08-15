import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(getColorHexFromStr("#EFF3FF")),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(getColorHexFromStr("#EFF3FF")),
        leading: Container(),
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "About ", 
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
              ),
            ),
            Text(
              "Me", 
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
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildLabel("Curso"),
            SizedBox(height: 2),
            _buildLabelResponse("Desenvolvimento de Aplicativos Móveis"),
            SizedBox(height: 10),
            _buildLabel("Graduação"),
            SizedBox(height: 2),
            _buildLabelResponse("Pós-graduação"),
            SizedBox(height: 10),
            _buildLabel("Aluno"),
            SizedBox(height: 2),
            _buildLabelResponse("Felipe Alexandre"),
            SizedBox(height: 10),
            _buildLabel("Url"),
            SizedBox(height: 2),
            _buildLabelResponse("https://github.com/thelifesnak3/cesarFlutter"),
          ],
        ),
      )
    );
  }
}

Widget _buildLabel(String label) {
  return Text(
    label,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      decoration: TextDecoration.none,
      letterSpacing: 2
    ),
  );
}

Widget _buildLabelResponse(String label) {
  return Text(
    label,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(getColorHexFromStr("#5868E0")),
      decoration: TextDecoration.none
    ),
  );
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