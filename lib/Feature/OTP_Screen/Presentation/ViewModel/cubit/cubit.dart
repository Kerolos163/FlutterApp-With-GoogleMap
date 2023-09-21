import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class OTPCubit extends Cubit<OTPState> {
  OTPCubit() : super(InitState());
  static OTPCubit get(context) => BlocProvider.of(context);
  late String otpCode;

  Future<void> submitOTP(context, String otpCode,String verificationId) async {
    emit(LoadingOTPState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneVerifiedState());
    } catch (e) {
      OTPFailureState(error: e.toString());
    }
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
