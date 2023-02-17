
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../share/api_constant.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(  )) {
    on <OnLoginEvent>(_validateToLogin);
  }

  Future<FutureOr<void>> _validateToLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
      state.copyWith(
        status: AuthStateStatus.loading
      )
    );

    try{
    if(event.username == '' && event.password == ''){
      emit(
        state.copyWith(
          status: AuthStateStatus.error,
          message: 'Username dan Password tidak boleh kosong',
        )
      );
    } else {
      var url = Uri.parse(ApiConstant.authentication);
      var request = await http.post(
        url,
        body: {
          'username' : event.username,
          'password' : event.password,
        }
      );
      var response = jsonDecode(request.body);
      if(response['status'] == 'fail'){
        emit(
          state.copyWith(
          message:  response['error_msg'],
          status: AuthStateStatus.error,
        )
      );
    } else {
        emit(
          state.copyWith(
          status: AuthStateStatus.success,
          )
        );
        print('data3 ${response['data']['username']}');
        await prefs.setString('id', response['data']['id_user']);
        await prefs.setString('username', response['data']['username']);
        await prefs.setString('nama', response['data']['nama']);
        await prefs.setString('id_ruas', response['data']['id_ruas']);
      }
    }

  } catch(error, stacktrace) {
    emit(
      state.copyWith(
        status: AuthStateStatus.error
      )
    );
  }
}
}
