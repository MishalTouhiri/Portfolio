import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF161513), // خلفية Footer
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          // الخط الأفقي
          Container(
            height: 1,
            color: Color(0xFFF0F2F5),
            margin: EdgeInsets.symmetric(vertical: 16),
          ),
          // المحتوى الرئيسي (الشعار والروابط)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الشعار
              Image.asset(
                'assets/WhiteLogo.png',
                width: 64,
              ),
              // الروابط
              Row(
                children: [
                  NavButton(label: 'Home', onPressed: () {}),
                  NavButton(label: 'Projects', onPressed: () {}),
                  NavButton(label: 'Experience', onPressed: () {}),
                ],
              ),
            ],
          ),
          // المحتوى السفلي (نص حقوق النشر والأيقونات)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // نص حقوق النشر
              Text(
                '© Designed by Naser',
                style: TextStyle(color: Color(0xFFF0F2F5)),
              ),
              // الأيقونات
              Row(
                children: [
                  SocialIcon(icon: Icons.facebook),
                  SocialIcon(icon: Icons.facebook),
                  SocialIcon(icon: Icons.facebook),
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
      child: Text(
        label,
        style: TextStyle(color: Color(0xFFF0F2F5)),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;

  SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
