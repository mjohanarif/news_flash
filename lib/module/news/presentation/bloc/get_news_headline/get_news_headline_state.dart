part of 'get_news_headline_bloc.dart';

@freezed
class GetNewsHeadlineState with _$GetNewsHeadlineState {
  const factory GetNewsHeadlineState.initial() = _Initial;
  const factory GetNewsHeadlineState.loading() = _Loading;
  const factory GetNewsHeadlineState.loaded(NewsResponse data) = _Loaded;
  const factory GetNewsHeadlineState.error(String message) = _Error;
}
