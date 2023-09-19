import 'package:flutter/material.dart';

import '../../../../../Core/Utils/mycolor.dart';

class VerifyInfo extends StatelessWidget {
  const VerifyInfo({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Verify your phone number",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 24,
        ),
        RichText(
          text: TextSpan(
              text: "Enter your 6 digit code numbers sent to you at ",
              style: const TextStyle(
                  fontSize: 18, height: 1.5, color: Colors.black),
              children: [
                TextSpan(
                  text: phoneNumber,
                  style: const TextStyle(color: MyColors.blue),
                )
              ]),
        )
      ],
    );
  }
}
