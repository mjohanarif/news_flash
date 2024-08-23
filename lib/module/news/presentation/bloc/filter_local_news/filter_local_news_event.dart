part of 'filter_local_news_bloc.dart';

@freezed
class FilterLocalNewsEvent with _$FilterLocalNewsEvent {
  const factory FilterLocalNewsEvent.started() = _Started;
  const factory FilterLocalNewsEvent.filterLocalNews(String params) =
      _FilterLocalNews;
}
