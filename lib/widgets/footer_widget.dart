import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xFF161513), // خلفية Footer
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الخط الأفقي
          Container(
            height: 1,
            color: Color(0xFFF0F2F5),
            margin: EdgeInsets.symmetric(vertical: 32),
          ),
          // المحتوى الرئيسي (الشعار والروابط)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الشعار
              Image.asset(
                'assets/WhiteLogo.png',
                width: screenWidth > 600 ? 80 : 60, // تغيير الحجم بناءً على الشاشة
              ),
              // الروابط
              if (screenWidth > 600)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NavButton(label: 'Home', onPressed: () {}),
                      SizedBox(width: 20),
                      NavButton(label: 'Projects', onPressed: () {}),
                      SizedBox(width: 20),
                      NavButton(label: 'Experience', onPressed: () {}),
                    ],
                  ),
                )
              else
                // في الشاشات الصغيرة
                Row(
                  children: [
                    NavButton(label: 'Home', onPressed: () {}),
                    SizedBox(width: 20),
                    NavButton(label: 'Projects', onPressed: () {}),
                    SizedBox(width: 20),
                    NavButton(label: 'Experience', onPressed: () {}),
                  ],
                ),
            ],
          ),
          SizedBox(height: 32),
          // المحتوى السفلي (نص حقوق النشر والأيقونات)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // نص حقوق النشر
              Text(
                '© Designed by Naser',
                style: TextStyle(
                  color: Color(0xFFF0F2F5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // الأيقونات الاجتماعية
              Row(
                children: [
                  SocialIcon(icon: Icons.facebook, url: 'https://facebook.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.safety_check, url: 'https://twitter.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.safety_check, url: 'https://linkedin.com'),
                  SizedBox(width: 16),
                  SocialIcon(icon: Icons.safety_check, url: 'https://instagram.com'),
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
        backgroundColor: Colors.transparent, // جعل الزر شفاف
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
        // هنا يمكنك فتح الرابط باستخدام URL Launcher
        print("Open link: $url");
      },
      child: Container(
        width: 40, // تحديد العرض والارتفاع
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // اللون الأبيض للإطار
            width: 2, // سمك الإطار
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20, // حجم الأيقونة داخل الإطار
        ),
      ),
    );
  }
}
