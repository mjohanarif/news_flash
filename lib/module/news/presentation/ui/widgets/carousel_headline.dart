import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/module/news/presentation/ui/widgets/headline_card.dart';
import 'package:news_flash/shared/shared.dart';

class CarouselHeadline extends StatefulWidget {
  final NewsResponse news;

  const CarouselHeadline({
    super.key,
    required this.news,
  });

  @override
  State<CarouselHeadline> createState() => _CarouselHeadlineState();
}

class _CarouselHeadlineState extends State<CarouselHeadline> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.news.articles
              ?.map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailNewsPage,
                      arguments: widget.news.articles?[_current],
                    );
                  },
                  child: HeadlineCard(urlToImage: e.urlToImage, title: e.title),
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 343 / 206,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
          ),
        ),
        const SpaceHeight(22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.news.articles?.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? AppColors.grey
                                : AppColors.primary)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList() ??
              [],
        ),
      ],
    );
  }
}
