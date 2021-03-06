part of 'index_bloc.dart';

abstract class IndexState extends Equatable {
  const IndexState();
}

class IndexInitial extends IndexState {
  @override
  List<Object> get props => [];
}

class IndexLoading extends IndexState {
  @override
  List<Object> get props => [];
}

class IndexLoaded extends IndexState {
  int index;

  IndexLoaded(this.index);

  int get getIndex => index;

  @override
  List<Object> get props => [index];
}

class IndexLoadFailed extends IndexState {
  String msg;

  IndexLoadFailed(this.msg);

  @override
  List<Object> get props => [msg];
}

class HoverIndexLoading extends IndexState {
  @override
  List<Object> get props => [];
}

class HoverIndexLoaded extends IndexState {
  int index;

  HoverIndexLoaded(this.index);

  int get getIndex => index;

  @override
  List<Object> get props => [index];
}

class TapIndexLoading extends IndexState {
  @override
  List<Object> get props => [];
}

class TapIndexLoaded extends IndexState {
  int index;

  TapIndexLoaded(this.index);

  int get getIndex => index;

  @override
  List<Object> get props => [index];
}
