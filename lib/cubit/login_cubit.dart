import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_developer/data/models/model_login.dart';
import 'package:test_flutter_developer/data/services/api_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<ModelLogin?> login({required String email, required String password}) async {
    var login = await ApiServices().login(
      email: email,
      password: password,
    );
    emit(LoginState(user: login));

    return login;
  }
}
