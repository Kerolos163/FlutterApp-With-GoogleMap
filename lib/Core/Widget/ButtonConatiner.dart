import 'package:flutter/material.dart';

import '../Utils/mycolor.dart';

class ButtonConatiner extends StatelessWidget {
  const ButtonConatiner({super.key, required this.txt,required this.func});
  final String txt;
  final void Function()? func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: MyColors.buttonColor,
            borderRadius: BorderRadius.circular(8)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Text(
                txt,
                style: TextStyle(
                    color: MyColors.textbuttonColor,
                    fontSize: constraints.maxWidth / 6),
              ),
            );
          },
        ),
      ),
    );
  }
}
