abstract class LoginPhoneState {}

class InitState extends LoginPhoneState {}

class LoginPhoneLoadingState extends LoginPhoneState {}

class LoginPhoneSuccessState extends LoginPhoneState {}

class LoginPhoneFailureState extends LoginPhoneState {
  final String error;

  LoginPhoneFailureState({required this.error});
}

class PhoneVerifiedState extends LoginPhoneState {}
