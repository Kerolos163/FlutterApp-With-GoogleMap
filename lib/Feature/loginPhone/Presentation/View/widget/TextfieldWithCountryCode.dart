import 'package:flutter/material.dart';

import 'TextFieldWidget.dart';

class TextfieldWithCountryCode extends StatelessWidget {
  const TextfieldWithCountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 46,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xffDCDCDC),
                )),
            child: Text(
              "${generateCountryFlag()} +20",
              style: const TextStyle(fontSize: 18, letterSpacing: 2),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          flex: 5,
          child: TextFieldWidget(),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = "eg";

    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }
}
