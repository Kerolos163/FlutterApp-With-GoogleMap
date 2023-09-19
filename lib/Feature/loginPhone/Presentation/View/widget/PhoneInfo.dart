import 'package:flutter/material.dart';

class PhoneInfo extends StatelessWidget {
  const PhoneInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your phone number?",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Please enter your phone number to verify your account.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
