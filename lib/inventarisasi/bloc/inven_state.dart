part of 'inven_bloc.dart';

enum InvenStateStatus {initial, success, error, loading}

extension InvenStateStatusX on InvenStateStatus{
  bool get isInitial => this == InvenStateStatus.initial;
  bool get isSuccess => this == InvenStateStatus.success;
  bool get isError => this == InvenStateStatus.error;
  bool get isLoading => this == InvenStateStatus.loading;
}

class InvenState extends Equatable {
  const InvenState({
    this.namaPemilik,
    this.nib,
    this.nik,
    this.alamat,
    this.noAlasHak,
    this.jenisHak,
    this.trase,
    this.fileUrl,
    this.status = InvenStateStatus.initial,
  });

  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? fileUrl;
  final InvenStateStatus status;


  @override
  List<Object?> get props => [
    namaPemilik,
    nib,
    nik,
    alamat,
    noAlasHak,
    jenisHak,
    trase,
    fileUrl,
    status,
  ];

  InvenState copyWith({
    String? namaPemilik,
    String? nib,
    String? nik,
    String? alamat,
    String? noAlasHak,
    String? jenisHak,
    String? trase,
    String? file,
    InvenStateStatus? status,
  }){
    return InvenState(
      namaPemilik: namaPemilik?? this.namaPemilik,
      nib: nib?? this.nib,
      nik: nik?? this.nik,
      alamat: alamat?? this.alamat,
      noAlasHak: noAlasHak?? this.noAlasHak,
      jenisHak: jenisHak?? this.jenisHak,
      trase: trase?? this.trase,
      fileUrl: file?? fileUrl,
      status: status?? this.status,
    );
  }
}
