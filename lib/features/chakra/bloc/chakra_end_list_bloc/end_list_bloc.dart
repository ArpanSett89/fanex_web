import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'end_list_event.dart';
part 'end_list_state.dart';

class EndListBloc extends Bloc<EndListEvent, EndListState> {
  EndListBloc() : super(EndListInitial()) {
    on<EndListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
