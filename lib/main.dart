import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter_developer/cubit/article_cubit.dart';
import 'package:test_flutter_developer/cubit/login_cubit.dart';
import 'package:test_flutter_developer/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ArticleCubit>(
          create: (context) => ArticleCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC',
        home: const LoginPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
