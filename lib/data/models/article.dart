part of 'models.dart';

class Articles extends Equatable {
  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Articles copyWith({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
  }) =>
      Articles(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        source: Source.fromJson(json["source"]),
        author: (json["author"] != null) ? json["author"] : "Not Identified",
        title: (json["title"] != null) ? json["title"] : "not identified",
        description: (json["description"] != null)
            ? json["description"]
            : "not identified",
        url: (json["url"] != null) ? json["url"] : "not identified",
        urlToImage: (json["urlToImage"] == null)
            ? "https://cdn0-production-images-kly.akamaized.net/kwYrjSBiS30aiuWq0gxsB1szMC4=/0x0:0x0/673x379/filters:quality(75):strip_icc():format(jpeg):watermark(kly-media-production/assets/images/watermarks/liputan6/watermark-gray-landscape-new.png,573,20,0)/kly-media-production/medias/3113243/original/050107700_1587977893-IMG_20200427_154636-01.jpeg"
            : json["urlToImage"],
        publishedAt: (json["publishedAt"] != null)
            ? DateTime.parse(json["publishedAt"])
            : DateTime.now(),
        content: json["content"] == null ? "Not Identified" : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
      };

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

Map<String, dynamic> json = {
  "source": {"id": "Not Identified", "name": "Not Identified"},
  "author": "Jihye Lee",
  "title":
      "Kakao co-CEO resigns after mass outage locked 53 million users out - CNBC",
  "description":
      "One of Kakao's top executives will step down after a fire at a data center led to a mass outage over the weekend and disrupted services for 53 million users.",
  "url":
      "https://www.cnbc.com/2022/10/19/kakao-co-ceo-resigns-after-mass-outage.html",
  "urlToImage":
      "https://image.cnbcfm.com/api/v1/image/106031585-1563780462965gettyimages-988165304.jpeg?v=1666145968&w=1920&h=1080",
  "publishedAt": "2022-10-19T02:19:00Z",
  "content":
      "A top executive at Kakao Corp., the operator of South Korea's top mobile messenger KakaoTalk, will step down. His resignation comes after a fire at a data center led to a mass outage over the weekend… [+1284 chars]"
};
