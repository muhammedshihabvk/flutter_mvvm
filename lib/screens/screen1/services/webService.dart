import 'dart:convert';

import 'package:flutter_mvvm/logHelper/simple_log_printer.dart';
import 'package:flutter_mvvm/screens/screen1/models/post.dart';
import 'file:///D:/FlutterUdemyProjects/flutter_mvvm/lib/screens/screen1/viewmodel/screenOneViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_mvvm/screens/screen1/models/post.dart';  async  await

class WebService {
  final logger = getLogger("WebService");
  Future<List<Post>> getAllPost() async {
    logger.i("web service getallPost started");
    final url = "https://jsonplaceholder.typicode.com/posts";
    final responce = await http.get(url);
    if(responce.statusCode ==200){
      final body = jsonDecode(responce.body);
      final Iterable json = body;
      logger.i("web service getAllPost completed");
      return json.map((post) => Post.fromJson(post)).toList();
    }
  }
}