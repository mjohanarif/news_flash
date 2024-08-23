import 'package:equatable/equatable.dart';

import 'package:news_flash/module/news/news.dart';

class NewsResponse extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  List<String> listImage() {
    List<String> temp = [];
    articles?.forEach((element) {
      temp.add(element.urlToImage ?? '');
    });
    return temp;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((x) => x.toJson()).toList(),
    };
  }

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'] != null
          ? List<ArticleModel>.from(
              (json['articles']).map<ArticleModel?>(
                (x) => ArticleModel.fromJson(x),
              ),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [];
}
