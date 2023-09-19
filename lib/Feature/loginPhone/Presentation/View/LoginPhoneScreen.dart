import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Utils/AppRoute.dart';
import '../../../../Core/Widget/showProgressIndicator.dart';
import '../ViewModel/cubit/cubit.dart';
import '../ViewModel/cubit/state.dart';
import 'package:go_router/go_router.dart';

import 'widget/LoginPhoneBody.dart';

class LogingPhoneScreen extends StatelessWidget {
  const LogingPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginPhoneCubit, LoginPhoneState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is LoginPhoneLoadingState) {
          showProgressIndicator(context);
        } else if (state is LoginPhoneSuccessState) {
          GoRouter.of(context).pop();
          GoRouter.of(context).push(
            AppRouter.otpScreen,
            extra: {
              'phoneNumber': "+20${LoginPhoneCubit.get(context).phoneNumber}",
              'verificationId': LoginPhoneCubit.get(context).verificationId,
            },
          );
        } else if (state is LoginPhoneFailureState) {
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              duration: const Duration(seconds: 10),
              backgroundColor: Colors.black,
            ),
          );
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: LoginPhoneBody(),
          ),
        ),
      ),
    );
  }
}
