part of 'http_bloc.dart';

abstract class HttpEvent extends Equatable {
  const HttpEvent();
}

class LoadHttpEvent extends HttpEvent {
  @override
  List<Object?> get props => [];
}