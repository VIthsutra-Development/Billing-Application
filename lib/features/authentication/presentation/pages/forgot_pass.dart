import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/features/authentication/presentation/bloc/auth_bloc.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushNamed(context, "/otp");
        }
        if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppSnackBar(message: state.message).build(context),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Forgot Password",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Image.asset(
                    "assets/login.jpg",
                    width: 340,
                  ),
                  AppTextField(
                    controller: _emailController,
                    hintText: "Enter Your Email",
                    prefixIcon: Icons.alternate_email_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return AppFilledButton(
                          isLoading: state is AuthLoadingState,
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              AuthForgotPassEvent(email: _emailController.text),
                            );
                          },
                          buttonText: "Submit");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
