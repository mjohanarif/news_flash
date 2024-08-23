import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class HomeNewsPage extends StatelessWidget {
  const HomeNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            BlocBuilder<GetNewsBloc, GetNewsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loaded: (data) {
                    return SearchInput(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.searchNewsPage,
                        );
                      },
                      readOnly: true,
                      onChanged: (value) {},
                    );
                  },
                );
              },
            ),
            const SpaceHeight(16),
            BlocBuilder<GetNewsHeadlineBloc, GetNewsHeadlineState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SkeletonHeadline(),
                  loaded: (data) => CarouselHeadline(news: data),
                  error: (message) {
                    return ErrorResponseWidget(
                      message: message,
                      onTap: () {
                        context.read<GetNewsHeadlineBloc>().add(
                              const GetNewsHeadlineEvent.getNewsHeadline(),
                            );
                      },
                    );
                  },
                );
              },
            ),
            const SpaceHeight(16),
            BlocBuilder<GetNewsBloc, GetNewsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SkeletonNews(),
                  error: (message) {
                    return ErrorResponseWidget(
                      message: message,
                      onTap: () {
                        context.read<GetNewsBloc>().add(
                              const GetNewsEvent.getNews(),
                            );
                      },
                    );
                  },
                  loaded: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'News Flash',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SpaceHeight(12),
                        ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return NewsCard(data: data.articles?[index]);
                          },
                          separatorBuilder: (context, index) =>
                              const SpaceHeight(12),
                          itemCount: data.articles?.length ?? 0,
                        ),
                      ],
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
