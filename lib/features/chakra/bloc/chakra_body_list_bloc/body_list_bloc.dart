import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/chakra_body_list_model.dart';
import '../../repository/chakra_body_list_repository.dart';

part 'body_list_event.dart';

part 'body_list_state.dart';

class BodyListBloc extends Bloc<BodyListEvent, BodyListState> {
  BodyListBloc() : super(BodyListInitial()) {
    ChakraBodyListRepository chakraBodyListRepository =
        ChakraBodyListRepository();
    ChakraBodyListModel chakraBodyListResponseModel = ChakraBodyListModel();
    List<Data> data = [];
    on<BodyListEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetBodyList) {
        emit(BodyListLoading());
        try {
          ChakraBodyListModel chakraEndDateListResponseModel =
              await chakraBodyListRepository.getData(event.id);
          emit(BodyListLoaded(chakraEndDateListResponseModel));
        } catch (e) {
          print(e);
          emit(BodyListError('error'));
        }
      }
      if (event is SearchBodyList) {
        emit(BodyListLoading());
        try {
          ChakraBodyListModel chakraEndDateListResponseModel =
              await chakraBodyListRepository.getData(event.id);
          chakraBodyListResponseModel.ack = chakraEndDateListResponseModel.ack;
          chakraBodyListResponseModel.details =
              chakraEndDateListResponseModel.details;
          chakraBodyListResponseModel.count =
              chakraEndDateListResponseModel.count;
          chakraBodyListResponseModel.start =
              chakraEndDateListResponseModel.start;
          chakraBodyListResponseModel.end = chakraEndDateListResponseModel.end;
          data = chakraEndDateListResponseModel.data!;
          data = chakraEndDateListResponseModel.data!
              .where((element) => element.userUsername
                  .toString()
                  .toLowerCase()
                  .contains(event.value.toString().toLowerCase()))
              .toSet()
              .toList();
          if(data.isEmpty){
            data=chakraEndDateListResponseModel.data!;
          }
            chakraBodyListResponseModel.data=data;
            emit(BodyListLoaded(chakraBodyListResponseModel));
          // for (int i = 0;
          //     i < chakraEndDateListResponseModel.data!.length;
          //     i++) {
          //   data=chakraBodyListResponseModel.data![i].userUsername
          //       .toString()
          //       .toLowerCase()
          //       .contains(event.value.toString().toLowerCase()).t
          //   // if (data[i].userUsername
          //   //     .toString()
          //   //     .toLowerCase()
          //   //     .contains(event.value.toString().toLowerCase())) {
          //   //   print("data found");
          //   //
          //   //   // if (data
          //   //   //     .where((element) =>
          //   //   //         element.userUsername.toString().toLowerCase().contains(chakraBodyListResponseModel.data![i].userUsername
          //   //   //             .toString()
          //   //   //             .toLowerCase())
          //   //   //         )
          //   //   //     .isEmpty) {
          //   //   //   data.add(chakraEndDateListResponseModel.data![i]);
          //   //   // }
          //   //   // chakraBodyListResponseModel.data = data;
          //   //   print(chakraBodyListResponseModel.data![0].userUsername);
          //   // } else {
          //   //   print("data not found");
          //   //   emit(BodyListError('No result found'));
          //   // }
          // }
        } catch (e) {
          print(e);
          emit(BodyListError('error'));
        }
      }
    });
  }
}
