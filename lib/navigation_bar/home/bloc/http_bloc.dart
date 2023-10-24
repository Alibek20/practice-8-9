import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/home_model.dart';
import '../repository/home_repository.dart';


part 'http_event.dart';
part 'http_state.dart';

class HttpBloc extends Bloc<HttpEvent, HttpState> {
  final HttpRepository _httpRepository;

  HttpBloc(this._httpRepository) : super(HttpLoadingState()) {
    on<LoadHttpEvent>((event, emit) async {
      emit(HttpLoadingState());
      try {
        final news = await _httpRepository.getNews();
        emit(HttpLoadedState(news));
      } catch (e) {
        emit(HttpErrorState(e.toString()));
      }
    });
  }
}