import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishal/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart'; // To use GetX controller

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final homeController = Get.find<HomeController>(); // Access HomeController

    return Container(
      color: Color(0xFF161513),
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal line
          Container(
            height: 1,
            color: Color(0xFFF0F2F5),
            margin: EdgeInsets.symmetric(vertical: 32),
          ),
          // Main content (logo and links)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Image.asset(
                'images/m.jpg',
                width: screenWidth > 600 ? 90 : 100,
              ),
              // Links
              if (screenWidth > 600)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NavButton(label: 'Home', onPressed: () => homeController.scrollTo('home')),
                      SizedBox(width: 20),
                      NavButton(label: 'Projects', onPressed: () => homeController.scrollTo('projects')),
                      SizedBox(width: 20),
                      NavButton(label: 'Experience', onPressed: () => homeController.scrollTo('experience')),
                    ],
                  ),
                )
              else
                Row(
                  children: [
                    NavButton(label: 'Home', onPressed: () => homeController.scrollTo('home')),
                    SizedBox(width: 20),
                    NavButton(label: 'Projects', onPressed: () => homeController.scrollTo('projects')),
                    SizedBox(width: 20),
                    NavButton(label: 'Experience', onPressed: () => homeController.scrollTo('experience')),
                  ],
                ),
            ],
          ),
          SizedBox(height: 32),
          // Footer content (copyright text and icons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Copyright text
              Text(
                '© Designed by Naser',
                style: TextStyle(
                  color: Color(0xFFF0F2F5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Social media icons
              Row(
                children: [
                  SocialIcon(icon: Icons.facebook, url: 'https://facebook.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.input, url: 'https://twitter.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.input, url: 'https://linkedin.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.input, url: 'https://instagram.com'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  NavButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Color(0xFFF0F2F5),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
