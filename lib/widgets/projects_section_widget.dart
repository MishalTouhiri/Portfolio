import 'package:flutter/material.dart';
import 'package:mishal/Custom%20Widget/CardWidget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // تحديد حجم الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 0),
      height: 250,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // إذا كان العرض أكبر من 600، يعني أننا في جهاز كمبيوتر أو جهاز كبير
          bool isDesktop = constraints.maxWidth > 600;

          return Center(
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '    Look at My',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48, // تصغير الحجم في الكمبيوتر
                              fontFamily: 'Bai Jamjuree',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Projects.',
                            style: TextStyle(
                              foreground: Paint()
                                  ..shader = LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    tileMode: TileMode.repeated,
                                    colors: [
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                    ],
                                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200, 100)),
                              fontSize: 48, // نفس الحجم لتكون في تناغم
                              fontFamily: 'Bai Jamjuree',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 500), // فاصل بين النص والكونتينر
                      SizedBox(
                        width: 505,
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur. Consequat tempus rhoncus cum in. Vel id donec adipiscing elit morbi amet. Fermentum aliquam sed vitae placerat quam nec convallis.',
                          style: TextStyle(
                            color: Color(0xFFEFF1F4),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.67,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Look at My ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36, // تعديل الحجم في الشاشات الصغيرة
                                fontFamily: 'Bai Jamjuree',
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                              ),
                            ),
                            TextSpan(
                              text: 'Projects.',
                              style: TextStyle(
                                fontSize: 36, // تعديل الحجم في الشاشات الصغيرة
                                fontFamily: 'Bai Jamjuree',
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    tileMode: TileMode.repeated,
                                    colors: [
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                      Color(0xFFFF855F),
                                      Color(0xFF8000FE),
                                    ],
                                  ).createShader(Rect.fromLTWH(0.0, 0.0, 200, 100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // فاصل بين النصين في الجوال
                      SizedBox(
                        width: screenWidth * 0.8, // يضبط الحجم حسب العرض
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur. Consequat tempus rhoncus cum in. Vel id donec adipiscing elit morbi amet. Fermentum aliquam sed vitae placerat quam nec convallis.',
                          style: TextStyle(
                            color: Color(0xFFEFF1F4),
                            fontSize: 16, // تقليل الحجم في الشاشات الصغيرة
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.67,
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
