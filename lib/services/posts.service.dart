import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/postsModels.dart';

 class PostService {

  final Map<String, String> _headers = {
    'Content-Type': 'application/json'
  };

  final String _uri = 'http://localhost:3000/api/v0/post';

  Future<List<PostModel>> getPosts(int count) async {
    try {
      final resp = await http.get(_uri);
      if (resp.body.isEmpty) return null;
      print (resp.body);
      final respf = json.decode(resp.body);
      return PostModel.fromArray(respf);
    } on Exception catch (e) {
      print('Exception 1: $e');
      return null;
    }
  }
  Future<dynamic> addPost(dynamic data) async{
    try {
      final resp = await http.post(_uri,headers: _headers, body: data);
       if (resp.body.isEmpty) return null;
      print (resp.body);
      final respf = json.decode(resp.body);
      return PostModel.fromArray(respf);
    } on Exception catch (e) {
      print('Exception 1: $e');
      return null;
    }
  }
 }