import 'package:flutter/material.dart';
import 'package:flutter_maps/Core/Utils/mycolor.dart';
import 'package:flutter_maps/Core/constant.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue[100]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AssetClass.myImage,
                fit: BoxFit.cover,
                height: 100,
                width: 90,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "kerolos Essa",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "+201065659127",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: MyColors.blue),
            )
          ]),
        ),
      ),
    );
  }
}
