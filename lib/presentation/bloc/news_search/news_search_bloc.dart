import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_class/common/failure.dart';
import 'package:online_class/data/models/models.dart';
import 'package:online_class/domain/usecases/search_news.dart';
import 'package:online_class/providerr/providers.dart';
import 'package:rxdart/rxdart.dart';
part 'news_search_event.dart';
part 'news_search_state.dart';

class NewsSearchBloc extends Bloc<NewsSearchEvent, NewsSearchState> {
  NewsSearchBloc(SearchNews searchNews) : super(NewsSearchInitial()) {
    on<NewsSearchEvent>((event, emit) async {
      if (event is OnQueryNewsChanged) {
        final query = event.query;
        if (query.isEmpty) {
          emit(NewsSearchInitial());
          return;
        }
        emit(NewsSearchLoading());
        final result = await searchNews.execute(query);
        result.fold((failure) {
          final resultState = NewsSearchError('Server Failure', retry: () {
            add(OnQueryNewsChanged(query));
          });
          emit(resultState);
        }, (data) async {
          if (data.articles.isNotEmpty) {
            final resultState = NewsSearchHasData(data);
            emit(resultState);
          } else {
            emit(NewsSearchEmpty(
                'Tidak Ada News Yang Ditemukan dari perintah : $query !'));
          }
        });
      }
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
  EventTransformer<NewsSearchEvent> debounce<NewsSearchEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
