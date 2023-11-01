import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_e_commerce_app/auth/register/view/cubit/states.dart';

import '../../../../api/api_manager.dart';
import '../../data/model/response/RegisterResponse.dart';


class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel() : super(RegisterLoadingState());

  // hold data - handle Logic
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool isObsecurePassword = true;
  bool isObsecureRePassword = true;

  void register() async {
    try {
      if (formKey.currentState!.validate()) {
        emit(RegisterLoadingState());
        RegisterResponse response = await ApiManager.register(
            nameController.text,
            emailController.text,
            passwordController.text,
            rePasswordController.text,
            phoneController.text);
        if (response.message != 'success') {
          emit(RegisterErrorState(errorMessage: response.message));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
