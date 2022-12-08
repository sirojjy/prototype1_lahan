part of 'auth_bloc.dart';


class AuthEvent extends Equatable{
  @override
  List<Object?> get props =>[];
}

class OnLoginEvent extends AuthEvent {
  final String? username;
  final String? password;

  OnLoginEvent({this.username, this.password});

  @override
  List<Object?> get props => [username, password];
}
