import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/chakra_body_list_model.dart';
import '../../repository/chakra_body_list_repository.dart';

part 'body_list_event.dart';
part 'body_list_state.dart';

class BodyListBloc extends Bloc<BodyListEvent, BodyListState> {

  BodyListBloc() : super(BodyListInitial()) {
    ChakraBodyListRepository chakraBodyListRepository=ChakraBodyListRepository();
    on<BodyListEvent>((event, emit) async{
      // TODO: implement event handler
      if(event is GetBodyList){
        emit(BodyListLoading());
        try{
          ChakraBodyListModel chakraEndDateListResponseModel=await chakraBodyListRepository.getData(event.id);
          emit(BodyListLoaded(chakraEndDateListResponseModel));
        }catch(e){
          print(e);
          emit (BodyListError('error'));
        }
      }
    });
  }
}
