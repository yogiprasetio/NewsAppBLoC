import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:online_class/data/models/models.dart';
import 'package:online_class/domain/repositories/news_repositories.dart';

import '../../common/failure.dart';

class SearchNews {
  final NewsRepository repository;

  final DateTime now = DateTime.now();
  SearchNews(this.repository);

  Future<Either<Failure, ArticleResults>> execute(String query) => repository
      .searchNews(DateFormat('yyyy-MM-dd').format(now).toString(), query);
}
