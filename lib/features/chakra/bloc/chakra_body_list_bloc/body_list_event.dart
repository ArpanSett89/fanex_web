part of 'body_list_bloc.dart';

abstract class BodyListEvent extends Equatable {
  const BodyListEvent();
}
class GetBodyList extends BodyListEvent{
 final String id;
  const GetBodyList(this.id);
  @override
  List<Object?> get props => [id];
}
class SearchBodyList extends BodyListEvent{
  final String id;
  final String value;
 const SearchBodyList(this.id,this.value);
  @override
  List<Object?> get props => [id,value];
}