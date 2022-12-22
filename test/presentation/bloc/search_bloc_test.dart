import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_class/common/failure.dart';
import 'package:online_class/data/models/models.dart';
import 'package:online_class/domain/usecases/search_news.dart';
import 'package:online_class/presentation/bloc/news_search/news_search_bloc.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchNews])
void main() {
  late MockSearchNews mockSearchNews;
  late NewsSearchBloc newsSearchBloc;
  setUp(() {
    mockSearchNews = MockSearchNews();
    newsSearchBloc = NewsSearchBloc(mockSearchNews);
  });

  final tArticle = <Articles>[
    Articles(
        author: "Kara Scannell, Patrick Oppmann, Allison Morrow",
        title:
            "Sam Bankman-Fried seeks bail deal while being extradited to US - CNN",
        description:
            "Sam Bankman-Fried will be extradited to the United States Wednesday night, Bahamas Attorney General Sen. Ryan Pinder confirmed.",
        url:
            "https://www.cnn.com/2022/12/21/business/sam-bankman-fried-extradited-to-us/index.html",
        content:
            "Sam Bankman-Fried will be extradited to the United States Wednesday night, Bahamas Attorney General Sen. Ryan Pinder confirmed.\r\nBankman-Fried will be extradited after the Foreign Minister of the Bah… [+3318 chars]",
        publishedAt: DateTime.now(),
        urlToImage:
            "https://media.cnn.com/api/v1/images/stellar/prod/221221165725-sam-bankman-fried-nassau-court-departure-1221-restricted.jpg?c=16x9&q=w_800,c_fill",
        source: Source(id: null, name: 'bussiness'))
  ];

  final tArticleResults =
      ArticleResults(status: 'ok', totalResults: 30, articles: tArticle);
  test("description", () {
    final result = tArticleResults.toEntity();
    expect(result, tArticleResults);
  });
  test("Initial State Bloc", () {
    expect(newsSearchBloc.state, NewsSearchInitial());
  });

  final tQuery = "tesla";
  final tNewsModel = tArticleResults;
  blocTest("Test BLoC should emit [loading,Has Data] if Successfully",
      build: () {
        when(mockSearchNews.execute(tQuery))
            .thenAnswer((realInvocation) async => Right(tNewsModel));
        return newsSearchBloc;
      },
      act: (NewsSearchBloc bloc) => bloc.add(OnQueryNewsChanged(tQuery)),
      wait: const Duration(microseconds: 100),
      expect: () => [NewsSearchLoading(), NewsSearchHasData(tNewsModel)],
      verify: (NewsSearchBloc bloc) {
        verify(mockSearchNews.execute(tQuery));
      });
  blocTest(
    "Should Be Emit [initial] when query is empty ",
    build: () => newsSearchBloc,
    act: (NewsSearchBloc bloc) => bloc.add(OnQueryNewsChanged('')),
    wait: const Duration(microseconds: 900),
    expect: () => [NewsSearchInitial()],
  );

  blocTest("Test BLoC should emit [loading,Has Data] if no Data",
      build: () {
        when(mockSearchNews.execute(tQuery)).thenAnswer(
            (realInvocation) async => Right(
                ArticleResults(status: '', articles: [], totalResults: 0)));
        return newsSearchBloc;
      },
      act: (NewsSearchBloc bloc) => bloc.add(OnQueryNewsChanged(tQuery)),
      wait: const Duration(microseconds: 100),
      expect: () =>
          [NewsSearchLoading(), NewsSearchEmpty('no news found $tQuery')],
      verify: (NewsSearchBloc bloc) {
        verify(mockSearchNews.execute(tQuery));
      });

  blocTest("Test BLoC should emit [loading,Has Data] if Server Failure",
      build: () {
        when(mockSearchNews.execute(tQuery))
            .thenAnswer((realInvocation) async => left(ServerFailure()));
        return newsSearchBloc;
      },
      act: (NewsSearchBloc bloc) => bloc.add(OnQueryNewsChanged(tQuery)),
      wait: const Duration(microseconds: 100),
      expect: () => [NewsSearchLoading(), NewsSearchError("Server bussy!")],
      verify: (NewsSearchBloc bloc) {
        verify(mockSearchNews.execute(tQuery));
      });
}
