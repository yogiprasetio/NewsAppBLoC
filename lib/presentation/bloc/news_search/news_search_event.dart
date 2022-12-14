part of 'news_search_bloc.dart';

abstract class NewsSearchEvent extends Equatable {
  const NewsSearchEvent();
  @override
  List<Object> get props => [];
}

class OnQueryNewsChanged extends NewsSearchEvent {
  final String query;
  OnQueryNewsChanged(this.query);
  @override
  List<Object> get props => [query];
}
