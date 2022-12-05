part of 'providers.dart';

enum ResultState {loading,noData,hasData,error}

class NewsProvider extends ChangeNotifier{
  final ApiService apiService;
  final String country, category;

  NewsProvider({required this.apiService, required this.country, required this.category}){
    _fetchTopHeadlines(country, category);
  }

  late ArticleResults _articleResults;
  late ResultState _state;
  String _message = '';
  String get message => _message;
  ArticleResults get result => _articleResults;
  ResultState get state => _state;

  Future <dynamic> _fetchTopHeadlines(String country, String category) async {
    try{
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.topHeadlines(country, category);
      if(article.articles.isEmpty){
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'empty Data';
  }else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articleResults = article;
  }
  } catch (e){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'ERROR => $e';
  }
}
}