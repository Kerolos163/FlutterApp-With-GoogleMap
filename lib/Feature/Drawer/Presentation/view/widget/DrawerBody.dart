import 'package:flutter/material.dart';
import 'CustomDivider.dart';
import 'DrawerHeaderWidget.dart';
import 'SocialContainer.dart';
import 'drawerItem.dart';

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
                drawerItem(
                  icon: Icons.person,
                  txt: "My Profile",
                  func: () {},
                ),
                const CustomDivider(),
                drawerItem(
                  icon: Icons.history,
                  txt: "Saved Places",
                  func: () {},
                ),
                const CustomDivider(),
                drawerItem(
                  icon: Icons.settings,
                  txt: "Settings",
                  func: () {},
                ),
                const CustomDivider(),
                drawerItem(
                  icon: Icons.help,
                  txt: "Help",
                  func: () {},
                ),
                const CustomDivider(),
                drawerItem(
                  icon: Icons.logout,
                  txt: "Logout",
                  iconColor: Colors.red,
                  tailicon: const SizedBox(),
                  func: () {},
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Follow Us",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SocialContainer()
        ],
      ),
    );
  }
}
