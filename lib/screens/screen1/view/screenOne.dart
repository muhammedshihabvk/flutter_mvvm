
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/logHelper/simple_log_printer.dart';
import 'package:flutter_mvvm/screens/screen1/models/post.dart';
import 'file:///D:/FlutterUdemyProjects/flutter_mvvm/lib/screens/screen1/viewmodel/screenOneViewModel.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  //screen name for page routing
  static final String nameRoute = "/ScreenOne";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  final logger = getLogger("_ScreenOneState");

  List<PostViewModel>  list = [];
  bool init = true;
  bool loading = true;
  bool listenFlag = true;

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   if(init){
  //     setState(() {
  //       loading = true;
  //     });
  //     final post = Provider.of<ScreenOneViewModel>(context,listen: false);
  //     post.fetchAllPosts().then((value) {
  //       setState(() {
  //         list = post.getPostItems;
  //       });
  //     });
  //     setState(() {
  //       loading=false;
  //     });
  //     init=false;
  //   }
  //   super.didChangeDependencies();
  // }


  @override
  void initState() {
    logger.i("initstate called"+list.toString());
    final post = Provider.of<ScreenOneViewModel>(context,listen: false);
    post.fetchAllPosts().then((value) {
      setState(() {
        list = post.getPostItems;
      });

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      logger.i("screenOne build"+list.toString());

      // final post = Provider.of<ScreenOneViewModel>(context,listen: false);
      // list = post.getPostItems;


    // final post = Provider.of<ScreenOneViewModel>(context,listen: false);
    // if(post.getPostItems.length>0){
    //   listenFlag=false;
    //   print("post value is loaded");
    // }
    // post.fetchAllPosts().then((value) {
    //   list = post.allPostList;
    //   logger.i(list);
    // });

    // final post = Provider.of<ScreenOneViewModel>(context,listen: false);
    // post.fetchAllPosts();
    // list = post.getPostItems;
    // logger.i(list);
    return  Scaffold(
        floatingActionButton: IconButton(icon: Icon(Icons.refresh),color: Colors.purple,),
        appBar: AppBar(
          title: Text("ScreenOne"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FlatButton(onPressed: () {

                }, child: Text("click")),
                  ...list.map((post) => Text(post.title)).toList(),
              ],
            ),
          ),
        ),
    );
  }
}
