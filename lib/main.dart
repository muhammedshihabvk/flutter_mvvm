import 'package:flutter/material.dart';
import 'file:///D:/FlutterUdemyProjects/flutter_mvvm/lib/screens/screen1/viewmodel/screenOneViewModel.dart';
import 'package:flutter_mvvm/screens/screen1/view/screenOne.dart';
import 'package:flutter_mvvm/screens/screen2/view/screenTwo.dart';
import 'package:flutter_mvvm/screens/screen3/view/screenThree.dart';
import 'package:provider/provider.dart';

import 'logHelper/simple_log_printer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final logger = getLogger("MyApp");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final post = Provider.of<ScreenOneViewModel>(context);
    // post.fetchAllPosts();
    // logger.i(post.getPostItems);


    return MaterialApp(
      title: 'Flutter MVVM Demo',
      // home: ScreenOne(),
      home: ChangeNotifierProvider(
        create: (context) => ScreenOneViewModel(),
        child: ScreenOne(),
      ),
      // initialRoute: ScreenOne.nameRoute,
      routes: {
        ScreenOne.nameRoute : (context) => ScreenOne(),
        ScreenTwo.nameRoute : (context) => ScreenTwo(),
        ScreenThree.nameRoute: (context) => ScreenThree(),
      },
    );
  }
}

