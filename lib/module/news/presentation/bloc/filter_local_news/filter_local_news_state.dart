part of 'filter_local_news_bloc.dart';

@freezed
class FilterLocalNewsState with _$FilterLocalNewsState {
  const factory FilterLocalNewsState.initial() = _Initial;
  const factory FilterLocalNewsState.loading() = _Loading;
  const factory FilterLocalNewsState.loaded(NewsResponse data) = _Loaded;
  const factory FilterLocalNewsState.error(String message) = _Error;
}
