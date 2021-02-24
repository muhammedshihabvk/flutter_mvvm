
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/logHelper/simple_log_printer.dart';
import 'package:flutter_mvvm/screens/screen1/models/post.dart';
import 'package:flutter_mvvm/screens/screen1/services/webService.dart';

class ScreenOneViewModel with ChangeNotifier{
  final logger = getLogger("ScreenOneViewModel");

  List<PostViewModel> _allPostList = List<PostViewModel>();


  void refresh(){
    notifyListeners();
  }

  List<PostViewModel> get getPostItems{
    return [..._allPostList];
  }

  Future<void> fetchAllPosts() async {
        final result = await WebService().getAllPost();
        this._allPostList = result.map((item){
          return PostViewModel(item);
        }).toList();
        notifyListeners();
        // return allPostList;
  }
}

class PostViewModel{
  final Post post;

  PostViewModel(this.post);

  String get title{
    return this.post.title;
  }

  String get body{
    return this.post.body;
  }

}
