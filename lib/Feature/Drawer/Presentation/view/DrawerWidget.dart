import 'package:flutter/material.dart';

import 'widget/DrawerBody.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: const SafeArea(
        child: DrawerBody(),
      ),
    );
  }
}
