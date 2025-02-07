import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishal/controllers/home_controller.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;

    return Stack(
      children: [
        Positioned(
          top: appBarHeight,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.75,  // زيادة الارتفاع قليلاً
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            // الصورة مع الحواف بتدرج لوني
                            Container(
                              width: 100, // تحديد الحجم
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.transparent,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFF855F),
                                    Color(0xFF8000FE),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/profile.jpg', // قم بتحديد الصورة المناسبة
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // الاسم مع التدرج اللوني
                            Text(
                              'Mishal Towhery',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: [
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                    ],
                                  ).createShader(Rect.fromLTWH(0.0, 0.0, 350, 100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          _buildNavButton('Home', 'home', Colors.white),
                          SizedBox(height: 16),
                          _buildNavButton('Projects', 'projects', Colors.white),
                          SizedBox(height: 16),
                          _buildNavButton('My Experties', 'experience', Colors.white, isRichText: true),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNavButton('Download CV', 'download_cv', Colors.white, buttonStyle: true, isOutlined: true, buttonWidth: 150),
                              SizedBox(width: 8),
                              _buildNavButton('Contact Me', 'contact', Colors.white, buttonStyle: true, buttonWidth: 150),
                            ],
                          ),
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIconButton(Icons.code, () {}, 'LinkedIn'),
                              SizedBox(width: 16),
                              _buildSocialIconButton(Icons.code, () {}, 'GitHub'),
                              SizedBox(width: 16),
                              _buildSocialIconButton(Icons.code, () {}, 'Twitter'),
                              SizedBox(width: 16),
                              _buildSocialIconButton(Icons.code, () {}, 'WhatsApp'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // بناء الأزرار الاجتماعية بدون خلفية مع إطار أبيض
  Widget _buildSocialIconButton(IconData icon, VoidCallback onPressed, String label) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  // بناء الأزرار الأخرى
  Widget _buildNavButton(String title, String section, Color color, {bool buttonStyle = false, bool isOutlined = false, bool isRichText = false, double buttonWidth = 200}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: buttonStyle
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isOutlined ? Colors.transparent : Colors.white,
                side: isOutlined ? BorderSide(color: Colors.white, width: 1.5) : BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: EdgeInsets.symmetric(vertical: 14),
                minimumSize: Size(buttonWidth, 50),
              ),
              onPressed: () => Get.find<HomeController>().scrollTo(section),
              child: Text(
                title,
                style: TextStyle(
                  color: isOutlined ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  height: 1.50,
                ),
              ),
            )
          : TextButton(
              onPressed: () => Get.find<HomeController>().scrollTo(section),
              child: isRichText
                  ? Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'My ',
                            style: TextStyle(
                              color: Color(0xFFEFF1F4),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                          TextSpan(
                            text: 'Experties',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
            ),
    );
  }
}
