abstract class OTPState {}

class InitState extends OTPState {}

class LoadingOTPState extends OTPState {}

class PhoneVerifiedState extends OTPState {}

class OTPFailureState extends OTPState {
  final String error;

  OTPFailureState({required this.error});
}
