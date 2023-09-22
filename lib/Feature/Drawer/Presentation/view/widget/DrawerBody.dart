import 'package:flutter/material.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/view/widget/CustomDivider.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/view/widget/DrawerHeaderWidget.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/view/widget/SocialContainer.dart';
import 'package:flutter_maps/Feature/Drawer/Presentation/view/widget/drawerItem.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                const DrawerHeaderWidget(),
                const SizedBox(
                  height: 19,
                ),
                drawerItem(icon: Icons.person, txt: "My Profile"),
                const CustomDivider(),
                drawerItem(icon: Icons.history, txt: "Saved Places"),
                const CustomDivider(),
                drawerItem(icon: Icons.settings, txt: "Settings"),
                const CustomDivider(),
                drawerItem(icon: Icons.help, txt: "Help")
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Follow Us"),
          ),
          const SocialContainer()
        ],
      ),
    );
  }
}


