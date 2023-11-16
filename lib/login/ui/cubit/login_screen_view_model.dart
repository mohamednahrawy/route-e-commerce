import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'login_states.dart';
class LogInScreenViewModel extends Cubit<LoginStates>{
  LogInScreenViewModel():super(LoginInitialState());
}