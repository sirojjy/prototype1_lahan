part of 'kategori_card_bloc.dart';

enum KategoriCardStatus { initial, success, error, loading }

extension KategoriCardInitial on KategoriCardStatus {
  bool get isInitial => this == KategoriCardStatus.initial;
  bool get success => this == KategoriCardStatus.success;
  bool get loading => this == KategoriCardStatus.loading;
  bool get error => this == KategoriCardStatus.error;
}

class KategoriCardState extends Equatable {
  final KategoriCardStatus? status;
  final String? message;
  final List<KategoriModel> dataKategoriCard;
  final String? luasIpal1;
  final String? luasIpal2;
  final String? luasIpal3;
  final String? luasPipa;
  final String? luasIpa;
  final String? luasSegment1;
  final String? luasSegment2;
  final String? luasSegment3;

  KategoriCardState(
      {this.status = KategoriCardStatus.initial,
        this.message,
        required this.dataKategoriCard,
        this.luasIpal1,
        this.luasIpal2,
        this.luasIpal3,
        this.luasPipa,
        this.luasIpa,
        this.luasSegment1,
        this.luasSegment2,
        this.luasSegment3});

  @override
  List<Object?> get props => [
    status,
    message,
    dataKategoriCard,
    luasIpal1,
    luasIpal2,
    luasIpal3,
    luasPipa,
    luasIpa,
    luasSegment1,
    luasSegment2,
    luasSegment3
  ];
  KategoriCardState copyWith({
    KategoriCardStatus? status,
    String? message,
    List<KategoriModel>? dataKategoriCard,
    String? luasIpal1,
    String? luasIpal2,
    String? luasIpal3,
    String? luasPipa,
    String? luasIpa,
    String? luasSegment1,
    String? luasSegment2,
    String? luasSegment3,
}) {
    return KategoriCardState(
      status: status ?? this.status,
      message: message ?? this.message,
      dataKategoriCard: dataKategoriCard ?? this.dataKategoriCard,
      luasIpal1: luasIpal1 ?? this.luasIpal1,
      luasIpal2: luasIpal2 ?? this.luasIpal2,
      luasIpal3: luasIpal3 ?? this.luasIpal3,
      luasPipa: luasPipa ?? this.luasPipa,
      luasIpa: luasIpa ?? this.luasIpa,
      luasSegment1: luasSegment1 ?? this.luasSegment1,
      luasSegment2: luasSegment2 ?? this.luasSegment2,
      luasSegment3: luasSegment3 ?? this.luasSegment3,
    );
  }
}