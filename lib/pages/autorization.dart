/*import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/gestures.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String email = '';
  String password = '';
  String errorText = '';

  void authUser() async {
    var data = await ConnectServer.getUserByEmailPassword(email, password);
    if (data.keys.first == 'error') {
      setState(() {
        errorText = data[data.keys.first];
      });
    } else {
      var box = Hive.box('userInfo');
      box.put('id', data.values.first);
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "BB",
          style: TextStyle(
              color: Color(0xFF58C8CF),
              fontFamily: 'Inria Sans',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF58C8CF),
              decorationThickness: 1),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF404040),
        toolbarHeight: 60,
      ),
      body: Center(
        child: Container(
          width: 334.0,
          height: 450,
          decoration: BoxDecoration(
            color: Color(0xFF404040),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(31.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Padding(
                        child: Image.asset('static/imgs/pig.png'),
                        padding: EdgeInsets.only(bottom: 30)),
                    Container(
                      child: Text(
                        errorText,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                      height: 20,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 271.0,
                      height: 57.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF4D4D4D),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 271.0,
                      height: 57.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF4D4D4D),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 34.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          authUser();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF58C8CF),
                          minimumSize: Size(140, 48),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.0),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Doesn't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inria Sans',
                            fontSize: 12,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Registery",
                              style: TextStyle(
                                color: Color(0xFF58C8CF),
                                fontFamily: 'Inria Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF58C8CF),
                                decorationThickness: 1,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/reg');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
