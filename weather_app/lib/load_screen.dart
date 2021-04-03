import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

class LoadScreen extends StatefulWidget {
  final String nextRoute;
  LoadScreen({this.nextRoute});
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/day_sky.jpg'),
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/your_weather.png'),
        ),
      ),
    );
  }
}
