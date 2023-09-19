import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginPhoneCubit extends Cubit<LoginPhoneState> {
  LoginPhoneCubit() : super(InitState());
  static LoginPhoneCubit get(context) => BlocProvider.of(context);

  late String verificationId;

  Future<void> submitPhoneNumber({required String phoneNumber}) async {
    emit(LoginPhoneLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    print("verificationFailed ${e.toString()}");
    emit(LoginPhoneFailureState(error: e.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print("codeSent");
    this.verificationId = verificationId;
    emit(LoginPhoneSuccessState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("codeAutoRetrievalTimeout");
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneVerifiedState());
    } catch (e) {
      LoginPhoneFailureState(error: e.toString());
    }
  }

  late String phoneNumber;

}
