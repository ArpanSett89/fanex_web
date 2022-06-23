part of 'index_bloc.dart';

abstract class IndexEvent extends Equatable {
  const IndexEvent();
}
class GetIndex extends IndexEvent{
   int index;
  GetIndex(this.index);
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
class GetHoverIndex extends IndexEvent{
  int index=0;
  GetHoverIndex(this.index);
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
class GetTapIndex extends IndexEvent{
  int index;
  GetTapIndex(this.index);
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}