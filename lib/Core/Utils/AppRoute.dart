// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Core/constant.dart';
import 'package:flutter_maps/Feature/MapScreen/presentation/view/mapScreen.dart';
import 'package:flutter_maps/Feature/MapScreen/presentation/viewmodel/cubit/cubit.dart';
import 'package:go_router/go_router.dart';

import '../../Feature/OTP_Screen/Presentation/View/OTPScreen.dart';
import '../../Feature/OTP_Screen/Presentation/ViewModel/cubit/cubit.dart';
import '../../Feature/loginPhone/Presentation/View/LoginPhoneScreen.dart';
import '../../Feature/loginPhone/Presentation/ViewModel/cubit/cubit.dart';

abstract class AppRouter {

  static const loginScreen = '/';
  static const otpScreen = '/OTPScreen';
  static const mapScreen = '/MapScreen';
  static final router = GoRouter(initialLocation: initialRoute,routes: [
    GoRoute(
      path: loginScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginPhoneCubit(),
        child: const LogingPhoneScreen(),
      ),
    ),
    GoRoute(
      path: otpScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => OTPCubit(),
        child: OTPScreen(
          phoneNumber: (state.extra as Map<String, dynamic>)['phoneNumber'],
          verificationId:
              (state.extra as Map<String, dynamic>)['verificationId'],
        ),
      ),
    ),
    GoRoute(
      path: mapScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => MapCubit(),
        child: const MapScreen(),
      ),
    ),
  ]);
}
