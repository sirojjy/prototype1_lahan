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
      var url = Uri.parse(ApiConstant.totalCard);
      var request = await http.post(
        url,
        body: {
          'id_ruas' : prefs.getString('id_ruas'),
        }
      );
      var response = jsonDecode(request.body);
      if(response == null) {
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
            ipal: response[0]['ipal'],
            spam: response[0]['spam'],
            dppt: response[0]['dppt'],
            luas_ipal: response[0]['luas_ipal'],
            luas_spam: response[0]['luas_spam'],
            luas_dppt: response[0]['luas_dppt'],
            nilai_ipal: response[0]['nilai_ipal'],
            nilai_spam: response[0]['nilai_spam'],
            nilai_dppt: response[0]['nilai_dppt'],
          )
        );

      }
    } catch(error) {
      // print('cek12');
      emit(
        state.copyWith(
          status: DashboardStateStatus.error
        )
      );
    }
  }
}
