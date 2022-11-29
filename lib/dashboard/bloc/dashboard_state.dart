part of 'dashboard_bloc.dart';

enum DashboardStateStatus { initial, success, error, loading }

extension DashboardStateStatusX on DashboardStateStatus {
  bool get isInitial => this == DashboardStateStatus.initial;
  bool get isSuccess => this == DashboardStateStatus.success;
  bool get isError => this == DashboardStateStatus.error;
  bool get isLoading => this == DashboardStateStatus.loading;
}

class DashboardState extends Equatable {

  const DashboardState({
    this.namaPemilik,
    this.nib,
    this.nik,
    this.alamat,
    this.noAlasHak,
    this.jenisHak,
    this.trase,
    this.file,
    this.status = DashboardStateStatus.initial,
  });

  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? file;
  final DashboardStateStatus status;



  @override
  // TODO: implement props
  List<Object?> get props => [
    namaPemilik,
    nib,
    nik,
    alamat,
    noAlasHak,
    jenisHak,
    trase,
    file,
    status,
  ];

  DashboardState copyWith ({
     String? namaPemilik,
     String? nib,
     String? nik,
     String? alamat,
     String? noAlasHak,
     String? jenisHak,
     String? trase,
     String? file,
    DashboardStateStatus? status,
  }) {
    return DashboardState(
      namaPemilik: namaPemilik?? this.namaPemilik,
      nib: nib?? this.nib,
      nik: nik?? this.nik,
      alamat: alamat?? this.alamat,
      noAlasHak: noAlasHak?? this.noAlasHak,
      jenisHak: jenisHak?? this.jenisHak,
      trase: trase?? this.trase,
      file: file?? this.file,
      status: status?? this.status,

    );
  }
}

// namaPemilik: namaPemilik?? this.namaPemilik,
//   nib: nib?? this.nib,
//   nik: nik?? this.nik,
//   alamat: alamat?? this.alamat,
//   noAlasHak: noAlasHak?? this.noAlasHak,
//   jenisHak: jenisHak?? this.jenisHak,
//   trase: trase?? this.trase,
//   file: file?? this.file,

