import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginHandler();
  }

  void loginHandler() async {
    if (await FirebaseAuth.instance.currentUser() != null) {
    // signed in
      Navigator.pushReplacementNamed(context, '/ProfilePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF005073), Color(0xFF71c7ec)]
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TypewriterAnimatedTextKit(
                            speed: Duration(milliseconds: 500),
                            totalRepeatCount: 4,
                            pause: Duration(milliseconds:  1000),
                            text: ['PsyCube'],
                            textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kInputDecoration.copyWith(hintText:'Enter your email'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kInputDecoration.copyWith(hintText: 'Enter your password'),
                        ),
                        LoginButton(
                            text: 'Login',
                          onPressed: () async {
                              try {
                                final NewUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                if(NewUser != null) {
                                  Navigator.pushNamed(context, '/ProfilePage');
                                } } catch(e){
                                print(e);
                              }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoginButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignUpPage');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
    );
  }
}

