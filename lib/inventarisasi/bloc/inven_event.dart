part of 'inven_bloc.dart';

class InvenEvent extends Equatable {
  @override
  List<Object?> get props =>[];
  const InvenEvent();
}

class AddInvenEvent extends InvenEvent {
  final String? namaPemilik;
  final String? nib;
  final String? nik;
  final String? alamat;
  final String? noAlasHak;
  final String? jenisHak;
  final String? trase;
  final String? fileUrl;

  const AddInvenEvent({this.namaPemilik, this.nib, this.nik, this.alamat, this.noAlasHak, this.jenisHak, this.trase, this.fileUrl});

  @override
  List<Object?> get props => [namaPemilik, nib, nik, alamat, noAlasHak, jenisHak, trase, fileUrl];
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

  const UpdateInvenEvent({this.id, this.namaPemilik, this.nib, this.nik, this.alamat, this.noAlasHak, this.jenisHak, this.trase, this.file});

  @override
  List<Object?> get props => [id, namaPemilik, nib, nik, alamat, noAlasHak, jenisHak, trase, file];
}

class DeleteInventEvent extends InvenEvent {
  final String? id;

  const DeleteInventEvent({this.id});
}