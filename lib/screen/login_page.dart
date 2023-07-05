import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_developer/constant/colors.dart';
import 'package:test_flutter_developer/constant/styles.dart';
import 'package:test_flutter_developer/cubit/article_cubit.dart';
import 'package:test_flutter_developer/cubit/login_cubit.dart';
import 'package:test_flutter_developer/data/models/model_login.dart';
import 'package:test_flutter_developer/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 250),
              child: Center(
                child: Text('My APPS', style: AppStyles.styleTextBody38(fontWeight: FontWeight.bold)),
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: AppColors.lightGreen,
                        ),
                        child: TextField(
                          decoration: AppStyles.inputDecoration("Username"),
                          style: AppStyles.styleTextBody14(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          controller: emailController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: AppColors.lightGreen,
                        ),
                        child: TextField(
                          decoration: AppStyles.inputDecoration(
                            "Password",
                            suffixIcon: const Icon(
                              Icons.visibility,
                            ),
                          ),
                          style: AppStyles.styleTextBody14(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {},
                          controller: passwordController,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.green,
                          ),
                          onPressed: () async {
                            ModelLogin? login = await BlocProvider.of<LoginCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (login != null) {
                              BlocProvider.of<ArticleCubit>(context).getArticle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
