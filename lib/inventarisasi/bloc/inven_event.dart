part of 'inven_bloc.dart';

class InvenEvent extends Equatable {
  @override
  List<Object?> get props =>[];
  InvenEvent();
}

class AddInvenEvent extends InvenEvent {
  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? file;

  AddInvenEvent({this.namaPemilik, this.nib, this.nik, this.alamat, this.noAlasHak, this.jenisHak, this.trase, this.file});

  @override
  List<Object?> get props => [namaPemilik, nib, nik, alamat, noAlasHak, jenisHak, trase, file];
}

class UpdateInvenEvent extends InvenEvent {
  final String? id;
  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? file;

  UpdateInvenEvent({this.id, this.namaPemilik, this.nib, this.nik, this.alamat, this.noAlasHak, this.jenisHak, this.trase, this.file});

  @override
  List<Object?> get props => [id, namaPemilik, nib, nik, alamat, noAlasHak, jenisHak, trase, file];
}

class DeleteInventEvent extends InvenEvent {
  final String? id;

  DeleteInventEvent({this.id});
}