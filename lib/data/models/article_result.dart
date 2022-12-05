part of 'models.dart';

class ArticleResults extends Equatable {
  ArticleResults({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Articles> articles;

  ArticleResults copyWith({
    required String status,
    required int totalResults,
    required List<Articles> articles,
  }) =>
      ArticleResults(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory ArticleResults.fromJson(Map<String, dynamic> json) => ArticleResults(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Articles>.from(json["articles"]
            .map((x) => Articles.fromJson(x))
            .where((articles) =>
                articles.author != null &&
                articles.urlToImage != null &&
                articles.publishedAt != null &&
                articles.content != null)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [articles, totalResults, status];
}
