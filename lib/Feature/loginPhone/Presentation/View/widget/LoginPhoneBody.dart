import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/Widget/ButtonConatiner.dart';
import '../../../../../Core/Widget/showProgressIndicator.dart';
import '../../ViewModel/cubit/cubit.dart';
import 'PhoneInfo.dart';
import 'TextfieldWithCountryCode.dart';

class LoginPhoneBody extends StatelessWidget {
  LoginPhoneBody({super.key});
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _phoneKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            const PhoneInfo(),
            const Spacer(),
            const TextfieldWithCountryCode(),
            const Spacer(flex: 6),
            Align(
              alignment: Alignment.centerRight,
              child: ButtonConatiner(
                txt: "Next",
                func: () {
                  // GoRouter.of(context)
                  //     .push(AppRouter.otpScreen, extra: "+201065659127");
                  showProgressIndicator(context);
                  if (!_phoneKey.currentState!.validate()) {
                    GoRouter.of(context).pop();
                  } else {
                    GoRouter.of(context).pop();
                    _phoneKey.currentState!.save();
                    print(LoginPhoneCubit.get(context).phoneNumber);
                    LoginPhoneCubit.get(context).submitPhoneNumber(phoneNumber: LoginPhoneCubit.get(context).phoneNumber);
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
