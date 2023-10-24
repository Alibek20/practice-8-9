part of 'http_bloc.dart';

abstract class HttpState extends Equatable {}

class HttpLoadingState extends  HttpState {
  @override
  List<Object?> get props => [];
}

class HttpLoadedState extends  HttpState {
  final List<HttpModel> data;
  HttpLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}

class HttpErrorState extends  HttpState {
  final String error;
   HttpErrorState(this.error);
  @override
  List<Object?> get props => [error];
}