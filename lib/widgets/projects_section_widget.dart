import 'package:flutter/material.dart';

class ProjectsSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // تحديد الألوان لكل جزء من النص
    Color colorLookAtMy = Colors.white; // لون "Look at My"

    return Container(
      margin: EdgeInsets.only(top: 0),
      height: 20,
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Look at My ',
                style: TextStyle(
                  color: colorLookAtMy, // تحديد اللون الأبيض لكلمة "Look at My"
                  fontSize: 64,
                  fontFamily: 'Bai Jamjuree',
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
              TextSpan(
                text: 'Projects.',
                style: TextStyle(
                  fontSize: 64,
                  fontFamily: 'Bai Jamjuree',
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode
                          .repeated, // تكرار التدرج للحصول على تأثير مموج
                      colors: [
                        Color(0xFFFF855F), // اللون البرتقالي
                        Color(0xFF8000FE), // اللون الأرجواني
                        Color(
                            0xFFFF855F), // إعادة اللون البرتقالي لتكرار الموجة
                        Color(0xFF8000FE), // إعادة اللون الأرجواني
                      ],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200,
                        100)), // تطبيق التدرج على كلمة "Projects"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
