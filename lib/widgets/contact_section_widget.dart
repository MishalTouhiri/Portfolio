import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // تحديد نسبة التصغير إذا كانت الشاشة أكبر من 600px
    double scaleFactor = (screenWidth > 600)
        ? 0.45
        : 1.0; // إذا كانت الشاشة كبيرة نقوم بتصغير الحجم بنسبة 35%

    return Container(
      width: screenWidth,
      height: screenHeight * 0.5,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // أول جزء من النص
          SizedBox(
            width: double.infinity,
            child: Text(
              'Want to start a project?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF939395),
                fontSize:
                    screenWidth * 0.08 * scaleFactor, // تصغير الحجم بنسبة 35%
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 18.47),

          // الجزء الثاني من النص
          SizedBox(
            width: double.infinity,
            child: Text(
              'Let’s Talk',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize:
                    screenWidth * 0.15 * scaleFactor, // تصغير الحجم بنسبة 35%
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 18.47),

          // زر "CONTACT US" مع حواف ملونة بتدرج
          GestureDetector(
            onTap: () {
              // رابط البريد الإلكتروني
              _launchEmail();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1 * scaleFactor, // تصغير الأبعاد
                vertical: screenHeight * 0.03 * scaleFactor, // تصغير الأبعاد
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3.07,
                  color: Color(0xFFFFFFFF), // اللون الذي تم إرساله
                ),

                borderRadius: BorderRadius.circular(45.31),
                color: Colors.transparent, // زر شفاف
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'CONTACT US',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth *
                          0.04 *
                          scaleFactor, // تصغير الحجم بنسبة 35%
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.41,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة لفتح البريد الإلكتروني
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'example@email.com', // استبدل هذا بعنوان بريدك الإلكتروني
      queryParameters: {
        'subject': 'Interested in starting a project',
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }
}
