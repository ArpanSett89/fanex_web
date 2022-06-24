import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/chakra_end_date_list_response_model.dart';
import '../../repository/chakra_end_list_repository.dart';

part 'end_list_event.dart';
part 'end_list_state.dart';

class EndListBloc extends Bloc<EndListEvent, EndListState> {
  EndListBloc() : super(EndListInitial()) {
    ChakraEndListRepository chakraEndListRepository=ChakraEndListRepository();
    on<EndListEvent>((event, emit) async{
      // TODO: implement event handler
      if(event is GetEndDateList){
        emit(EndListLoading());
        try{
          ChakraEndDateListResponseModel chakraEndDateListResponseModel=await chakraEndListRepository.getData();
          emit(EndListLoaded(chakraEndDateListResponseModel));
        }catch(e){
          print(e);
          emit (EndListError('error'));
        }
      }
    });
  }
}
