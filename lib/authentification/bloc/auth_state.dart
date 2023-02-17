part of 'auth_bloc.dart';

enum AuthStateStatus {initial, success, error, loading}

extension AuthStateStatusX on AuthStateStatus{
  bool get isInitial => this == AuthStateStatus.initial;
  bool get isSuccess => this == AuthStateStatus.success;
  bool get isError => this == AuthStateStatus.error;
  bool get isLoading => this == AuthStateStatus.loading;
}

class AuthState extends Equatable {
  final AuthStateStatus status;
  final String? username;
  final String? password;
  final String? message;

  const AuthState({
    this.status = AuthStateStatus.initial,
    this.username,
    this.password,
    this.message}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    username,
    password,
    message,
  ];

  AuthState copyWith({
    AuthStateStatus? status,
    String? username,
    String? password,
    String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }
}

