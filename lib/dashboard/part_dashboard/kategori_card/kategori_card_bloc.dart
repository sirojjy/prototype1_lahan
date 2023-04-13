import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prototype1_lahan/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/model_dashboard.dart';

part 'kategori_card_event.dart';
part 'kategori_card_state.dart';

class KategoriCardBloc extends Bloc<KategoriCardEvent, KategoriCardState> {
  KategoriCardBloc()
      : super(KategoriCardState(
          dataKategoriCard: [],
        )) {
      on<ViewKategoriCard>(viewKategoriCard);
  }

  FutureOr<void> viewKategoriCard(
      ViewKategoriCard event, Emitter<KategoriCardState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataKategoriCard = <KategoriModel>[];

    emit(state.copyWith(status: KategoriCardStatus.loading));

    try {
      var url = Uri.parse(ApiConstant.kategoriCard);
      var request = await http.post(url, body: {
        'id_ruas': prefs.getString('id_ruas'),
      });
      var response = jsonDecode(request.body);
      for (int i = 0; i < response.length; i++) {
        dataKategoriCard.add(KategoriModel(
          luasIpal1: response[0]['luas_ipal1'],
          luasIpal2: response[0]['luas_ipal2'],
          luasIpal3: response[0]['luas_ipal3'],
          luasPipa: response[0]['luas_pip'],
          luasIpa: response[0]['luas_ipa'],
          luasSegment1: response[0]['luas_segmen1'],
          luasSegment2: response[0]['luas_segmen2'],
          luasSegment3: response[0]['luas_segmen3'],
        ));
      }
      emit(state.copyWith(
        status: KategoriCardStatus.success,
        dataKategoriCard: dataKategoriCard,
      ));

      // for (int i = 0; i < dataKategoriCard.length; i++) {
      //   print('data luas segment 1: ${dataKategoriCard[i].luasSegment1}');
      // }

      ///test

      // if(response == null){
      //   emit(
      //     state.copyWith(
      //       message: response['error_msg'],
      //       status: KategoriCardStatus.error,
      //     )
      //   );
      // } else {
      //   emit(state.copyWith(
      //     status: KategoriCardStatus.success,
      //     luasIpal1: response[0]['luas_ipal1'],
      //     luasIpal2: response[0]['luas_ipal2'],
      //     luasIpal3: response[0]['luas_ipal3'],
      //     luasPipa: response[0]['luas_pip'],
      //     luasIpa: response[0]['luas_ipa'],
      //     luasSegment1: response[0]['luas_segmen1'],
      //     luasSegment2: response[0]['luas_segmen2'],
      //     luasSegment3: response[0]['luas_segmen3'],
      //   ));
      // }
    } catch (error) {
      emit(state.copyWith(status: KategoriCardStatus.error));
    }
  }
}
