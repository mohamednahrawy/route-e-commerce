import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_e_commerce_app/auth/ui/cubit/states.dart';
import '../../data/model/response/RegisterResponse.dart';
import '../../domain/use_case/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterLoadingState());

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
        RegisterResponse response = await registerUseCase.register(
            nameController.text, emailController.text, passwordController.text,
            rePasswordController.text, phoneController.text);
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
