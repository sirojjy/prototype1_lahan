part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class GetDashboardEvent extends DashboardEvent {
  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? file;

  GetDashboardEvent({this.namaPemilik, this.nib, this.nik, this.alamat, this.noAlasHak, this.jenisHak, this.trase, this.file});

  @override
  List<Object?> get props => [namaPemilik, nib, nik, alamat, noAlasHak, jenisHak, trase, file];
}

