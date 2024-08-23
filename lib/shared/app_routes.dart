import 'package:flutter/material.dart';
import 'package:news_flash/module/news/news.dart';

class AppRoutes {
  static const String main = '/';
  static const String detailNewsPage = '/detail-news-page';
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
