import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/module/news/presentation/ui/widgets/carousel_headline.dart';
import 'package:news_flash/shared/shared.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            BlocBuilder<GetNewsHeadlineBloc, GetNewsHeadlineState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => Skeleton(
                    width: AppDimension.width,
                    height: 200,
                  ),
                  loaded: (data) => CarouselHeadline(news: data),
                  error: (message) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(message),
                            IconButton(
                              onPressed: () {
                                context.read<GetNewsHeadlineBloc>().add(
                                      const GetNewsHeadlineEvent
                                          .getNewsHeadline(),
                                    );
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                            const Text('Try to reload'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
