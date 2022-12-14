import 'package:get_it/get_it.dart';
import 'package:online_class/presentation/bloc/news_search/news_search_bloc.dart';

import 'data/datasources/news_remote_data_sources.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/repositories/news_repositories.dart';
import 'domain/usecases/search_news.dart';

final locator = GetIt.instance;
void init() {
  locator.registerFactory(() => NewsSearchBloc(locator()));
  locator.registerLazySingleton(() => SearchNews(locator()));
  locator.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: locator()));
}
