import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:atitimetable/main.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyLogInPage(),
    );
  }
}

class MyLogInPage extends StatefulWidget {
  @override
  _MyLogInPageState createState() => _MyLogInPageState();
}

class _MyLogInPageState extends State<MyLogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = 'jaycode@gmail.com';
  String password = '123456';
  String inputEmail = '';
  String inputPassword = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Hero(
                  tag: '@atiHero',
                  child: Text(
                    'Ati',
                    style: TextStyle(
                        fontSize: 200.0,
                        fontFamily: 'FredokaOne',
                        color: Colors.blue),
                  ),
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Be Smart Manage Time',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 160),
                  ),
                ],
                totalRepeatCount: 3,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {
                    inputEmail = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  onChanged: (value) {
                    inputPassword = value;
                  },
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Pasword',
                    hintStyle: TextStyle(fontSize: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.black54,
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          ),
                        ]),
                    height: 53.0,
                    width: 350.0,
                    child: Center(
                      child: Text(
                        'LogIn',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (inputEmail == email && inputPassword == password) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      passwordController.clear();
                      emailController.clear();
                    } else if (inputEmail == email &&
                        inputPassword != password &&
                        inputPassword != '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'You have enterd a wrong password! Please try again.'),
                            );
                          });
                      passwordController.clear();
                    } else if (inputEmail == email && inputPassword == '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  Text('Please enter enterd you password!'),
                            );
                          });
                      passwordController.clear();
                    } else if (inputEmail == '' && inputPassword == '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'You cannot login without filling your credantials. Do not try the system, Please enter your credantials'),
                            );
                          });
                      passwordController.clear();
                    } else if (inputEmail == '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Please enter your email.'),
                            );
                          });
                      passwordController.clear();
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'Please provide the right credantials and try again.'),
                            );
                          });
                      emailController.clear();
                      passwordController.clear();
                    }
                  }),
              SizedBox(
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
