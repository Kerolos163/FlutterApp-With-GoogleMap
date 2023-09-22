import 'package:flutter/material.dart';

import '../../../../../Core/Utils/mycolor.dart';

drawerItem(
    {required IconData icon,
    required String txt,
    Color? iconColor,
    Widget? tailicon,required void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Icon(
            icon,
            size: 34,
            color: iconColor ?? MyColors.blue,
          ),
          const SizedBox(width: 8),
          Text(
            txt,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          tailicon ??
              const Icon(
                Icons.arrow_forward_ios,
                color: MyColors.blue,
                weight: 100,
              )
        ],
      ),
    ),
  );
}
