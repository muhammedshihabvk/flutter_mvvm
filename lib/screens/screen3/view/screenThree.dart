import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {

  //screen name for page routing
  static final  String nameRoute = "/ScreenThree";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScreenThree"),),
      body: Column(
        children: [
          Container(
            child: Text("Screen Three"),
          ),
        ],
      ),
    );
  }
}