import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/core/widgets/app_text_field.dart';
import 'package:new_billing/features/authentication/presentation/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password must contain at least one lowercase letter";
    } else if (!RegExp(r'\d').hasMatch(password)) {
      return "Password must contain at least one number";
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushReplacementNamed(context, "/home");
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/login.jpg",
                      width: 340,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment(-1, 0),
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment(-1, 0),
                      child: Text(
                        "Sign in to Your Account to Start Billing.",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      validator: (value) {
                        if (!isValidEmail(value!)) {
                          return "Please enter a valid Email";
                        }
                        return null;
                      },
                      controller: _emailController,
                      hintText: "Email",
                      prefixIcon: Icons.alternate_email_rounded,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      validator: (value) {
                        return validatePassword(value!);
                      },
                      controller: _passwordController,
                      hintText: "Password",
                      prefixIcon: Icons.password_rounded,
                      keyboardType: TextInputType.text,
                      isPasswordField: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AppFilledButton(
                          isLoading: state is AuthLoadingState,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginEvent(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          buttonText: "Sign In",
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an Account?",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                  "Register.",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
