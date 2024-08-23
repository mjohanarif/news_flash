import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_flash/module/news/news.dart';

part 'get_news_event.dart';
part 'get_news_state.dart';
part 'get_news_bloc.freezed.dart';

class GetNewsBloc extends Bloc<GetNewsEvent, GetNewsState> {
  final GetNewsUsecase getNewsUsecase;
  GetNewsBloc(this.getNewsUsecase) : super(const _Initial()) {
    on<_GetNews>((event, emit) async {
      emit(const _Loading());

      final result = await getNewsUsecase(null);

      result.fold(
        (l) => emit(_Error(l.message)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
