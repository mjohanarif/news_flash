import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_flash/module/news/news.dart';

part 'filter_local_news_event.dart';
part 'filter_local_news_state.dart';
part 'filter_local_news_bloc.freezed.dart';

class FilterLocalNewsBloc
    extends Bloc<FilterLocalNewsEvent, FilterLocalNewsState> {
  final FilterLocalNewsUsecase filterLocalNewsUsecase;

  FilterLocalNewsBloc(this.filterLocalNewsUsecase) : super(const _Initial()) {
    on<_FilterLocalNews>((event, emit) async {
      emit(const _Loading());

      final result = await filterLocalNewsUsecase(event.params);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
