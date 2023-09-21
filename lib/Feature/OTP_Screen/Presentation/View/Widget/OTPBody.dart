import 'package:flutter/material.dart';
import "../../../../../Core/Widget/showProgressIndicator.dart";
import '../../ViewModel/cubit/cubit.dart';
import '../../../../../Core/Utils/mycolor.dart';
import '../../../../../Core/Widget/ButtonConatiner.dart';
import 'VerifyInfo.dart';
import 'pinCodeField.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({super.key, required this.phoneNumber, required this.verificationId});
  final String phoneNumber;
  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          VerifyInfo(phoneNumber: phoneNumber),
          const Spacer(flex: 2),
          const OTPField(),
          const Spacer(flex: 4),
          Align(
            alignment: Alignment.centerRight,
            child: ButtonConatiner(
              txt: "Verify",
              func: () {
                showProgressIndicator(context);
                OTPCubit.get(context).submitOTP(
                    context,
                    OTPCubit.get(context).otpCode,
                    verificationId);
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: Text("Didn’t recieve a verification code?")),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Resend code",
                      style: TextStyle(color: MyColors.blue, fontSize: 12),
                    ),
                    Container(
                      width: 1.5,
                      height: 20,
                      color: Colors.black,
                    ),
                    const Text(
                      " Change number",
                      style: TextStyle(color: MyColors.blue, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
