import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {

  //screen name for page routing
  static final  String nameRoute = "/ScreenTwo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScreenTwo"),),
      body: Column(
        children: [
          Container(
            child: Text("ScreenTwo"),
          ),
        ],
      ),
    );
  }
}