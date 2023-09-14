part of 'sign_bloc.dart';

abstract class SignState extends Equatable {
  final FirebaseAuth auth;
  final User? user;

  const SignState(this.auth, {this.user});

  @override
  List<Object> get props => [auth, user ?? "No data"];
}

class SignInitial extends SignState {
  const SignInitial(super.auth, {super.user});
}

class SignLoading extends SignState {
  const SignLoading(super.auth, {super.user});
}

class SignFailure extends SignState {
  const SignFailure(super.auth, {super.user});
}

class SignSuccessSignIn extends SignState {
  const SignSuccessSignIn(super.auth, {super.user});
}

class SignSuccessSignUp extends SignState {
  const SignSuccessSignUp(super.auth, {super.user});
}
