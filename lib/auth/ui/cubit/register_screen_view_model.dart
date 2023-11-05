import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_e_commerce_app/auth/ui/cubit/states.dart';
import '../../data/model/response/register_response.dart';
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
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }
  }
}
