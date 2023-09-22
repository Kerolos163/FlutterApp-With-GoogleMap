import 'package:flutter/material.dart';
import 'package:flutter_maps/Core/Utils/mycolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Row(
        children: [
          iconContainer(icon: FontAwesomeIcons.facebook, url: "https://www.facebook.com/king.koko.3785/"),
          const SizedBox(width: 8),
          iconContainer(icon: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com/in/kerolos-essa-0430a61b7/"),
          const SizedBox(width: 8),
          iconContainer(icon: FontAwesomeIcons.instagram, url: "https://www.instagram.com/koko_wesso_/?hl=ar"),
        ],
      ),
    );
  }

  iconContainer({required IconData icon, required String url}) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch $url');
        }
      },
      child: Icon(
        icon,
        color: MyColors.blue,
        size: 34,
      ),
    );
  }
}
