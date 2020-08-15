import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void login() {
      Navigator.pushNamed(context, '/home', arguments: emailController.text);
    }

    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(getColorHexFromStr("#474BD9")),
                    Color(getColorHexFromStr("#6B88E8"))
                  ]
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Workout",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 5,
                    
                  ),
                )
              ),
            ),
            Positioned(
              top: 140,
              left: 20,
              right: 20,
              child: Container(
                height: 330,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          "Please login to your account.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildLabel("Email Address"),
                    _buildTextField(Icons.email, "Email", emailController),
                    SizedBox(height: 20),
                    _buildLabel("Password"),
                    _buildTextField(Icons.visibility_off, "Password", passwordController),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: LinearGradient(
                            colors: [
                              Color(getColorHexFromStr("#474BD9")),
                              Color(getColorHexFromStr("#6B88E8"))
                            ]
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(0.0, 1.5),
                              blurRadius: 1.5,
                            ),
                          ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () { login(); },
                              child: Center(
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        )
    );
  }

  

  Widget _buildLabel(String label) {
  return Text(
    label,
    style: TextStyle(
      color: Colors.grey
    ),
  );
}

  Widget _buildTextField(IconData icon, String hint, TextEditingController controller) {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'O campo número do selo é obrigatório' : null,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
      )
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
}