part of 'get_news_headline_bloc.dart';

@freezed
class GetNewsHeadlineEvent with _$GetNewsHeadlineEvent {
  const factory GetNewsHeadlineEvent.started() = _Started;
  const factory GetNewsHeadlineEvent.getNewsHeadline() = _GetNewsHeadline;
}
