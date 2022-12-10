import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:prototype1_lahan/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
      on<OnJumlahIpalEvent>(_validateToJumlahIpal);
    });
  }


  FutureOr<void> _validateToJumlahIpal(OnJumlahIpalEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
      state.copyWith(
        status: DashboardStateStatus.loading
      )
    );

    try{
      var url = Uri.parse(ApiConstant.authentication);
      var request = await http.post(
        url,
        body: {
          'ipal' : event.ipal,
          'spam' : event.spam,
          'dppt' : event.dppt,
          'luas_ipal' : event.luas_ipal,
          'luas_spam' : event.luas_spam,
          'luas_dppt' : event.luas_dppt,
          'nilai_ipal' : event.nilai_ipal,
          'nilai_spam' : event.nilai_spam,
          'nilai_dppt' : event.nilai_dppt,
        }
      );
      var response = jsonDecode(request.body);
      if(response['ipal'] == 'fail') {
        emit(
          state.copyWith(
            message: response['error_msg'],
            status: DashboardStateStatus.error,
          )
        );
      } else {
        emit(
          state.copyWith(
            status: DashboardStateStatus.success,
          )
        );
      }
    } catch(error) {
      emit(
        state.copyWith(
          status: DashboardStateStatus.error
        )
      );
    }
  }
}
