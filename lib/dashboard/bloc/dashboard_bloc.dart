import 'dart:async';
// import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  DashboardBloc() : super(const DashboardState()) {
    on<DashboardEvent>(_getDashboardItem) {

    }

    FutureOr<void> _getDashboardItem(GetDashboardEvent event, Emitter<DashboardState> emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      emit(
        state.copyWith(
          status: DashboardStateStatus.loading
        )
      );
    }
  }
}
