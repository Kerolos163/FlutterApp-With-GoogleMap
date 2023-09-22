import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/Utils/AppRoute.dart';
import '../../../../Core/Widget/showProgressIndicator.dart';
import '../ViewModel/cubit/cubit.dart';
import '../ViewModel/cubit/state.dart';
import 'Widget/OTPBody.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen(
      {super.key, required this.phoneNumber, required this.verificationId});
  final String phoneNumber;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    print("WESSSSSSSSSSSSo   ${verificationId}");
    return BlocListener<OTPCubit, OTPState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is LoadingOTPState) {
          showProgressIndicator(context);
        } else if (state is PhoneVerifiedState) {
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(AppRouter.mapScreen);
        } else if (state is OTPFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              duration: const Duration(seconds: 30),
              backgroundColor: Colors.black,
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: OTPBody(
            phoneNumber: phoneNumber,
            verificationId: verificationId,
          ),
        ),
      ),
    );
  }
}
