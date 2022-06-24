part of 'end_list_bloc.dart';

abstract class EndListState extends Equatable {
  const EndListState();
}

class EndListInitial extends EndListState {
  @override
  List<Object> get props => [];
}
class EndListLoading extends EndListState {
  @override
  List<Object> get props => [];
}
class EndListLoaded extends EndListState {
   ChakraEndDateListResponseModel chakraEndDateListResponseModel;
  EndListLoaded(this.chakraEndDateListResponseModel);
  ChakraEndDateListResponseModel get getChakraEndDateListResponseModel=>chakraEndDateListResponseModel;
  @override
  List<Object> get props => [chakraEndDateListResponseModel];
}
class EndListError extends EndListState {
  String msg;
  EndListError(this.msg);
  @override
  List<Object> get props => [msg];
}