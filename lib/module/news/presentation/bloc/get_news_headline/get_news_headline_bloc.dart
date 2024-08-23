import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_flash/module/news/news.dart';

part 'get_news_headline_event.dart';
part 'get_news_headline_state.dart';
part 'get_news_headline_bloc.freezed.dart';

class GetNewsHeadlineBloc
    extends Bloc<GetNewsHeadlineEvent, GetNewsHeadlineState> {
  final GetHeadlineNewsUsecase getHeadlineNewsUsecase;
  GetNewsHeadlineBloc(this.getHeadlineNewsUsecase) : super(const _Initial()) {
    on<_GetNewsHeadline>((event, emit) async {
      emit(const _Loading());

      final result = await getHeadlineNewsUsecase(null);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
