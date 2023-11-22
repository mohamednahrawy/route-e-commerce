import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import '../../domain/use_case/signin_use_case.dart';
import 'sign_in_states.dart';

class SignInViewModel extends Cubit<SignInStates> {
  SignInUseCase useCase;

  SignInViewModel({required this.useCase}) : super(SignInInitialState());

  //holds data - handle logic
  var formKey = GlobalKey<FormState>();
  var signInEmailController = TextEditingController();
  var signInPasswordController = TextEditingController();
  bool isObsecurePassword = true;

  void signIn() async {
    if (formKey.currentState!.validate()) {
      emit(SignInLoadingState());
      var either = await useCase.signIn(
          email: signInEmailController.text,
          password: signInPasswordController.text);
      either.fold((l) {
        emit(SignInErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(SignInSuccessState(response: response));
      });
    }
  }
}
