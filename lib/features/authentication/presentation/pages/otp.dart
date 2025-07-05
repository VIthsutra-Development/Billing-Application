import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_billing/core/themes/colors.dart';
import 'package:new_billing/core/widgets/app_filled_button.dart';
import 'package:new_billing/core/widgets/app_snack_bar.dart';
import 'package:new_billing/features/authentication/presentation/bloc/auth_bloc.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  static const int totalTime = 5 * 60;
  int _secondsRemaining = totalTime;
  Timer? _timer;

  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
  final TextEditingController _otp5Controller = TextEditingController();
  final TextEditingController _otp6Controller = TextEditingController();

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    _otp5Controller.dispose();
    _otp6Controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String getOtp() {
    return "${_otp1Controller.text}${_otp2Controller.text}${_otp3Controller.text}${_otp4Controller.text}${_otp5Controller.text}${_otp6Controller.text}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushNamed(context, '/resetPass');
        }
        if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            AppSnackBar(message: state.message).build(context),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  "Enter OTP",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.lock,
                size: 200,
                color: AppColors.blue,
              ),
              SizedBox(height: 30),
              Text(
                'Please enter the 6-digit OTP sent to your email',
                style: TextStyle(color: AppColors.blue),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // _buildOtpFields(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp1Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp2Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp3Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp4Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp5Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 64,
                    child: TextFormField(
                      autofocus: true,
                      controller: _otp6Controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthOtpEvent(
                              otp:
                                  "${_otp1Controller.text}${_otp2Controller.text}${_otp3Controller.text}${_otp4Controller.text}${_otp5Controller.text}${_otp6Controller.text}",
                            ),
                          );
                        }
                      },
                      cursorColor: AppColors.blue,
                      cursorHeight: 20,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                formattedTime,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 20),
              AppFilledButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthOtpEvent(
                      otp:
                          "${_otp1Controller.text}${_otp2Controller.text}${_otp3Controller.text}${_otp4Controller.text}${_otp5Controller.text}${_otp6Controller.text}",
                    ),
                  );
                },
                buttonText: 'Verify OTP',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't recieve the code?",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//   Widget _buildOtpFields() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildOtpField(_otp1Controller, true),
//         _buildOtpField(_otp2Controller, false),
//         _buildOtpField(_otp3Controller, false),
//         _buildOtpField(_otp4Controller, false),
//         _buildOtpField(_otp5Controller, false),
//         _buildOtpField(_otp6Controller, false),
//       ],
//     );
//   }

//   Widget _buildOtpField(TextEditingController controller, bool autofocus) {
//     return SizedBox(
//       width: 45,
//       child: TextField(
//         autofocus: autofocus,
//         controller: controller,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         maxLength: 1,
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//         style: TextStyle(
//           color: AppColors.blue,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
}
