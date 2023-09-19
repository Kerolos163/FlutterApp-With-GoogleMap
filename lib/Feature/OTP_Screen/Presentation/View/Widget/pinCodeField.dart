import 'package:flutter/material.dart';
import 'package:flutter_maps/Feature/OTP_Screen/Presentation/ViewModel/cubit/cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../Core/Utils/mycolor.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeFillColor: MyColors.lightblue,
        inactiveFillColor: Colors.white,
        inactiveColor: MyColors.blue,
        activeColor: MyColors.blue,
        selectedColor: MyColors.blue,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (myCode) {
        OTPCubit.get(context).otpCode = myCode;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
