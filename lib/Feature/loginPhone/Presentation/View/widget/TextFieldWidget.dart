import 'package:flutter/material.dart';

import '../../../../../Core/Utils/mycolor.dart';
import '../../ViewModel/cubit/cubit.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 2,
        ),
        scrollPadding: EdgeInsets.zero,
        cursorColor: MyColors.blue,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return "please Enter Phone Number";
          } else if (value.length < 10) {
            return "Too Short a Phone Number";
          }
          return null;
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyColors.blue,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffDCDCDC),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff0666EB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                )),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ))),
        onSaved: (newValue) {
          print(newValue!.length);
          LoginPhoneCubit.get(context).phoneNumber = newValue;
        },
      ),
    );
  }
}
