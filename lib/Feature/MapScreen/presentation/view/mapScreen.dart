import 'package:flutter/material.dart';

import '../../../Drawer/Presentation/view/DrawerWidget.dart';
import 'widget/mapBody.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapBody(),
      drawer: DrawerScreen(),
    );
  }
}
