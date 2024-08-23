import 'package:flutter/material.dart';
import 'package:news_flash/module/news/news.dart';

class AppRoutes {
  static const String main = '/';
  static const String detailNewsPage = '/detail-news-page';
  static const String searchNewsPage = '/search-news-page';
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return _materialRoute(
          const HomeNewsPage(),
        );

      case detailNewsPage:
        return _materialRoute(
          DetailNewsPage(
            article: settings.arguments as ArticleModel?,
          ),
        );

      case searchNewsPage:
        return _materialRoute(
          const SearchNewsPage(),
        );

      default:
        return _materialRoute(
          const HomeNewsPage(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => view,
    );
  }
}
