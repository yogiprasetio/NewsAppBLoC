import 'dart:io';

import 'package:online_class/data/models/models.dart';
import 'package:online_class/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:online_class/domain/repositories/news_repositories.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRepositoryImpl remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ArticleResults>> searchNews(
      String date, String query) async {
    try {
      final results = await remoteDataSource.searchNews(date, query);
      return Right(results);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(ConnectionFailure());
    }
  }
}
