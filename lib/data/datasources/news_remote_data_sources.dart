import 'dart:convert';
import 'package:online_class/data/models/models.dart';
import 'package:http/http.dart' as http;
import '../../common/constants.dart';

abstract class NewsRemoteDataSource {
  Future<ArticleResults> searchNews(String date, String query);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client = http.Client();
  NewsRemoteDataSourceImpl();

  @override
  Future<ArticleResults> searchNews(String date, String query) async {
    final response = await http.get(Uri.parse(
        "${BASE_URL}everything?q=${query}&from=${date}&sortBy=publishedAt&apiKey=$API_KEY"));
    if (response.statusCode == 200) {
      return ArticleResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get Data');
    }
  }
}
