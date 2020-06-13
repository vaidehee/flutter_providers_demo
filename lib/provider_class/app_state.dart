import 'dart:convert';
import 'package:flutter_providers/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AppStateClass extends ChangeNotifier {
  String textData = "";
  bool isLoading = false;
  String jsonResponse = "";

  final String url = "https://jsonplaceholder.typicode.com/photos";

  String getTextData() => textData;

  void setTextData(String text) {
    textData = text;
    notifyListeners();
  }

  bool get isFetching => isLoading;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = response.body;
    }

    isLoading = false;
    notifyListeners();
  }

  List<PhotoModel> getPhotoData() {
    if (jsonResponse.isNotEmpty) {
      final parsed = jsonDecode(jsonResponse).cast<Map<String, dynamic>>();
      return parsed
          .map<PhotoModel>((json) => PhotoModel.fromJson(json))
          .toList();
    }
    return null;
/*
    isLoading=true;
    notifyListeners();
    final response=  client.get(url);
    print("res==>${response.body.toString()}");
    if(response.statusCode==200)
    {
      isLoading=false;
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      notifyListeners();
      return parsed.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();

    }
    else
    {
      isLoading=false;
      print("status code not valid ${response.statusCode.toString()}");
      notifyListeners();
      throw Exception('Failed to load post');
    }*/
  }
}
