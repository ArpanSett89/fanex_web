import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_list_event.dart';
part 'body_list_state.dart';

class BodyListBloc extends Bloc<BodyListEvent, BodyListState> {
  BodyListBloc() : super(BodyListInitial()) {
    on<BodyListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
