part of 'top_card_bloc.dart';


enum TopCardStateStatus {initial, success, error, loading}

extension TopCardInitial on TopCardStateStatus {
  bool get isInitial => this == TopCardStateStatus.initial;
  bool get success => this == TopCardStateStatus.success;
  bool get error => this == TopCardStateStatus.error;
  bool get loading => this == TopCardStateStatus.loading;
}

class TopCardState extends Equatable {

  const TopCardState({
    this.status = TopCardStateStatus.initial,
    this.ipal,
    this.spam,
    this.dppt,
    this.luas_ipal,
    this.luas_spam,
    this.luas_dppt,
    this.nilai_ipal,
    this.nilai_spam,
    this.nilai_dppt,
    this.message,
  });

  final TopCardStateStatus? status;
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

  @override
  List<Object?> get props => [
    status, ipal, spam, dppt, luas_ipal, luas_spam, luas_dppt, nilai_ipal, nilai_spam, nilai_dppt, message,
  ];

  TopCardState copyWith({
    TopCardStateStatus? status,
    String? ipal,
    String? spam,
    String? dppt,
    String? luas_ipal,
    String? luas_spam,
    String? luas_dppt,
    String? nilai_ipal,
    String? nilai_spam,
    String? nilai_dppt,
    String? message,
  }) {
    // TODO: implement copyWith
    return TopCardState(
      status: status ?? this.status,
      ipal: ipal ?? this.ipal,
      spam: spam ?? this.spam,
      dppt: dppt ?? this.dppt,
      luas_ipal: luas_ipal ?? this.luas_ipal,
      luas_spam: luas_spam ?? this.luas_spam,
      luas_dppt: luas_dppt ?? this.luas_dppt,
      nilai_ipal: nilai_ipal ?? this.nilai_ipal,
      nilai_spam: nilai_spam ?? this.nilai_spam,
      nilai_dppt: nilai_dppt ?? this.nilai_dppt,
      message: message ?? this.message,
    );
  }
}
