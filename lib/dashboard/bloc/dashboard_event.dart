part of 'dashboard_bloc.dart';

class DashboardEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class OnJumlahIpalEvent extends DashboardEvent {
  final String? status;
  final String? ipal;
  final String? spam;
  final String? dppt;
  final String? luas_ipal;
  final String? luas_spam;
  final String? luas_dppt;
  final String? nilai_ipal;
  final String? nilai_spam;
  final String? nilai_dppt;
  final String? message;

  OnJumlahIpalEvent(this.status, this.ipal, this.spam, this.dppt, this.luas_ipal, this.luas_spam, this.luas_dppt, this.nilai_ipal, this.nilai_spam, this.nilai_dppt, this.message);
}
