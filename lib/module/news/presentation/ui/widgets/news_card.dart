import 'package:flutter/material.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel? data;
  const NewsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.detailNewsPage,
          arguments: data,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCachedImage(
            urlToImage: data?.urlToImage,
            width: 100,
            height: 100,
          ),
          const SpaceWidth(16),
          Expanded(child: Text(data?.title ?? '')),
        ],
      ),
    );
  }
}
