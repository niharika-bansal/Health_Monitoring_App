import 'dart:async';
import 'package:doctor/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => WelcomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/heart.gif', // Path to your smaller image
              width: 200, // Adjust the width as needed
            ),
            SizedBox(height: 20),
            Text(
              "WELCOME TO A HEALTHY LIFE!",
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                fontFamily: 'YourCustomFont', // Replace with your custom font family
              ),
            ),
          ],
        ),
      ),
    );
  }
}