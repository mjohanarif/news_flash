import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flash/module/news/news.dart';
import 'package:news_flash/shared/shared.dart';

class SearchNewsPage extends StatelessWidget {
  const SearchNewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      context.read<FilterLocalNewsBloc>().add(
                            const FilterLocalNewsEvent.filterLocalNews(''),
                          );
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: SearchInput(
                      onChanged: (value) {
                        context.read<FilterLocalNewsBloc>().add(
                              FilterLocalNewsEvent.filterLocalNews(value),
                            );
                      },
                      controller: TextEditingController(),
                    ),
                  ),
                  const SpaceWidth(20),
                ],
              ),
              const SpaceHeight(16),
              Expanded(
                child: BlocBuilder<FilterLocalNewsBloc, FilterLocalNewsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => const SkeletonNews(),
                      error: (message) => ErrorResponseWidget(
                        message: message,
                        onTap: () {
                          context.read<GetNewsBloc>().add(
                                const GetNewsEvent.getNews(),
                              );
                        },
                      ),
                      loaded: (data) {
                        if (data.articles?.isNotEmpty ?? false) {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return NewsCard(data: data.articles?[index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SpaceHeight(12),
                            itemCount: data.articles?.length ?? 0,
                          );
                        } else {
                          return const Center(
                            child: Text('No News Data Found'),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
