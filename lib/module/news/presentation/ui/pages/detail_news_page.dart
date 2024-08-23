import 'package:flutter/material.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class DetailNewsPage extends StatelessWidget {
  final ArticleModel? article;

  const DetailNewsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          CustomCachedImage(urlToImage: article?.urlToImage),
          ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            primary: false,
            children: [
              Text(
                article?.title ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SpaceHeight(4),
              Text(
                '${article?.publishedAt?.convertDateString}, by ${article?.author}',
                style: const TextStyle(color: AppColors.grey, fontSize: 12),
              ),
              const SpaceHeight(16),
              Text(article?.description ?? ''),
            ],
          ),
        ],
      ),
    );
  }
}
