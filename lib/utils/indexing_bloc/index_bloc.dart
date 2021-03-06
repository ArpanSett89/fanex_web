import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitial()) {
    on<IndexEvent>((event, emit) {
      if(event is GetIndex)
      {
        emit(IndexLoading());
        try{
          final int getIndex=event.index;
          emit(IndexLoaded(getIndex));
        }catch(e){
          print(e);
          emit(IndexLoadFailed('error'));
        }
      } if(event is GetHoverIndex)
      {
        emit(HoverIndexLoading());
        try{
          final int getIndex=event.index;
          emit(HoverIndexLoaded(getIndex));
        }catch(e){
          print(e);
          emit(IndexLoadFailed('error'));
        }
      }
      if(event is GetTapIndex)
      {
        emit(TapIndexLoading());
        try{
          final int getIndex=event.index;
          emit(TapIndexLoaded(getIndex));
        }catch(e){
          print(e);
          emit(IndexLoadFailed('error'));
        }
      }
    });
    // on<IndexEvent>((event, emit) {
    //   if(event is GetHoverIndex)
    //   {
    //     emit(HoverIndexLoading());
    //     try{
    //       final int getIndex=event.index;
    //       emit(HoverIndexLoaded(getIndex));
    //     }catch(e){
    //       print(e);
    //       emit(IndexLoadFailed('error'));
    //     }
    //   }
    // });
    // on<IndexEvent>((event, emit) {
    //   if(event is GetTapIndex)
    //   {
    //     emit(TapIndexLoading());
    //     try{
    //       final int getIndex=event.index;
    //       emit(TapIndexLoaded(getIndex));
    //     }catch(e){
    //       print(e);
    //       emit(IndexLoadFailed('error'));
    //     }
    //   }
    // });
  }
}
