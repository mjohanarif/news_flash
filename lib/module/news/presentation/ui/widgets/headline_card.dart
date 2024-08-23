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
          CustomCachedImage(
            urlToImage: urlToImage,
            height: 206,
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
