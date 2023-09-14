import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'sign_event.dart';

part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  SignBloc() : super(SignInitial(FirebaseAuth.instance)) {
    on<SignUp>(_signUp);
    on<SignIn>(_signIn);
  }

  void _signUp(SignUp event, Emitter emit) async {
    try {
      emit(SignLoading(state.auth));
      String email = event.email;
      String password = event.password;

      print(state.auth.currentUser);
      await state.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignSuccessSignUp(state.auth));
    } catch (e) {
      emit(SignFailure(state.auth));
      debugPrint("Error: $e");
    }
  }

  void _signIn(SignIn event, Emitter emit) async {
    try {
      emit(SignLoading(state.auth));
      String email = event.email;
      String password = event.password;

      UserCredential response = await state.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        SignSuccessSignIn(
          FirebaseAuth.instance,
          user: response.user,
        ),
      );
    } catch (e) {
      emit(SignFailure(state.auth));
      debugPrint("Error: $e");
    }
  }
}
