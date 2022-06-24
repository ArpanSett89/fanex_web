part of 'body_list_bloc.dart';

abstract class BodyListEvent extends Equatable {
  const BodyListEvent();
}
class GetBodyList extends BodyListEvent{
  String id;
  GetBodyList(this.id);
  @override
  List<Object?> get props => [id];
}