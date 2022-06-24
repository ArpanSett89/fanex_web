part of 'body_list_bloc.dart';

abstract class BodyListState extends Equatable {
  const BodyListState();

  @override
  List<Object> get props => [];
}

class BodyListInitial extends BodyListState {}

class BodyListLoading extends BodyListState {}

class BodyListLoaded extends BodyListState {
  final ChakraBodyListModel chakraBodyListModel;

  const BodyListLoaded(this.chakraBodyListModel);

  ChakraBodyListModel get getChakraEndDateListResponseModel =>
      chakraBodyListModel;

  @override
  List<Object> get props => [chakraBodyListModel];
}

class BodyListError extends BodyListState {
  String msg;

  BodyListError(this.msg);

  @override
  List<Object> get props => [msg];
}
