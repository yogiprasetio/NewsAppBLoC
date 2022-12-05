import 'package:dartz/dartz.dart';
import 'package:online_class/data/models/models.dart';

import '../../common/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, ArticleResults>> searchNews(String date, String query);
}
