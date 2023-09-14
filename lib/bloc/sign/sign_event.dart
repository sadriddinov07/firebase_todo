part of 'sign_bloc.dart';

abstract class SignEvent extends Equatable {
  const SignEvent();

  @override
  List<Object?> get props => [];
}

class GetInitial extends SignEvent {}

class SignUp extends SignEvent {
  final String email;
  final String password;

  const SignUp({
    required this.email,
    required this.password,
  });
}

class SignIn extends SignEvent {
  final String email;
  final String password;

  const SignIn({
    required this.email,
    required this.password,
  });
}
