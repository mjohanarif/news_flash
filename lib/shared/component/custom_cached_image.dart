import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flash/shared/shared.dart';

class CustomCachedImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? urlToImage;

  const CustomCachedImage({
    super.key,
    required this.urlToImage,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage ?? Constant().imagePlaceholderUrl,
      height: height,
      placeholder: (context, url) => Skeleton(
        width: width,
        height: height,
      ),
      width: width,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) =>
          Image.asset('assets/placeholder-news.jpeg'),
    );
  }
}
