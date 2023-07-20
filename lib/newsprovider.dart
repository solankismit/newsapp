import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:provider/provider.dart';
class NewsProvider with ChangeNotifier {
    final apiKey = 'e3c5e380edb3459b8eda99aa6e8ddc17';
  String _selectedCategory = "General";
  bool _isLoading = true;
  List<Articles> _newsList = [];
  List<Articles> _newsListByCategory = [];
  final Dio _dio = Dio();

  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;
  List<Articles> get newsList => _newsList;
  List<Articles> get newsListByCategory => _newsListByCategory;

  Future<List<Articles>> fetchNewsAll() async {
    final url = 'https://newsapi.org/v2/top-headlines?apiKey=${apiKey}&category=general&country=in';
    _isLoading = true;
    try {
      final response = await _dio.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {

        final news = GetNewsModel.fromJson(response.data);
        _newsList = news.articles!;
        // _newsList =

        // Update news by the selected category as well
        // _updateNewsByCategory(_selectedCategory);
      } else {
        _newsList = [];
        _newsListByCategory = [];
      }
    } catch (error) {
      _newsList = [];
      _newsListByCategory = [];
    }
    // print(_newsList);
    // print(_newsListByCategory);
    // notifyListeners();
    _isLoading = false;
    notifyListeners();
    print(_newsList);
    return _newsList;
  }
  //
  // Future<void> _updateNewsByCategory(String category) async {
  //   _newsListByCategory = _newsList.where((news) => news.source == category).toList();
  //   notifyListeners();
  // }


  Future<void> fetchNewsByCategory(String category) async {
    final url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';

    _isLoading = true;
    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {

        final news = GetNewsModel.fromJson(response.data);
        _newsListByCategory = news.articles!;
      } else {
        _newsListByCategory = [];
      }
    } catch (error) {
      _newsListByCategory = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  void ChangeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
