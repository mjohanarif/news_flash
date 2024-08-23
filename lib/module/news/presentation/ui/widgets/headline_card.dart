import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flash/shared/shared.dart';

class HeadlineCard extends StatelessWidget {
  final String? urlToImage;
  final String? title;

  const HeadlineCard({
    super.key,
    required this.urlToImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: urlToImage ??
                'https://diony.co.uk/wp-content/themes/diony/assets/images/placeholder-news.jpeg',
            height: 206,
            width: AppDimension.width,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                Image.asset('assets/placeholder-news.jpeg'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.black.withOpacity(0.3),
                child: Text(
                  title ?? '',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
