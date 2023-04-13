import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'total_event.dart';
part 'total_state.dart';

class TotalBloc extends Bloc<TotalEvent, TotalState> {
  TotalBloc() : super(TotalInitial()) {
    on<TotalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
