import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_class/data/models/models.dart';

class ApiService {
  static const String apiKey = "b047eeb5b6e14bd0bcdf5ded235e669b";
  static const String url = "https://newsapi.org/v2/";

  // http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=
  //https://newsapi.org/v2/everything?q=tesla&from=2022-09-19&sortBy=publishedAt&apiKey=b047eeb5b6e14bd0bcdf5ded235e669b
  Future<ArticleResults> topHeadlines(String country, String category) async {
    final response = await http.get(Uri.parse(
        "${url}top-headlines?country=${country}&category=${category}&apiKey=${apiKey}"));

    if (response.statusCode == 200) {
      return ArticleResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Loaded data');
    }
  }

  Future<ArticleResults> SearchHeadlines(String date, String query) async{
    final response = await http.get(Uri.parse("${url}everything?q=${query}&from=${date}&sortBy=publishedAt&apiKey=${apiKey}"));
    if (response.statusCode == 200){
      return ArticleResults.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('failed to get Data');
    }
  }
}
