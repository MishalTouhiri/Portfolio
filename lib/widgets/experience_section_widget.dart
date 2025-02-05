import 'package:flutter/material.dart';
import 'package:mishal/Custom%20Widget/InfoCardWidget.dart';

class ExperienceSectionWidget extends StatelessWidget {
  final List<Map<String, String>> experiences = [
    {
      "title": "Experience 1",
      "description": "This is a short description of experience 1.",
      "imageUrl": "images/m.jpg"
    },
    {
      "title": "Experience 2",
      "description":
          "A brief description for experience 2 that fits within the card.",
      "imageUrl": "images/exp2.jpg"
    },
    {
      "title": "Experience 3",
      "description":
          "A concise summary of experience 3. Designed to stay within bounds.",
      "imageUrl": "images/exp3.jpg"
    },
    {
      "title": "Experience 4",
      "description": "Short experience description to prevent overflow.",
      "imageUrl": "images/exp4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth =
        screenWidth > 900 ? screenWidth * 0.2 : screenWidth * 0.4;
    double cardHeight = screenWidth > 900 ? 550 : 350;
    double spacing = screenWidth > 600 ? 60 : 40;

    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
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
                                'Look at My',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontFamily: 'Bai Jamjuree',
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Experience.',
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
                                    ).createShader(
                                        Rect.fromLTWH(0.0, 0.0, 200, 100)),
                                  fontSize: 48,
                                  fontFamily: 'Bai Jamjuree',
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 500),
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
                                    fontSize: 36,
                                    fontFamily: 'Bai Jamjuree',
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Experience.',
                                  style: TextStyle(
                                    fontSize: 36,
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
                                      ).createShader(
                                          Rect.fromLTWH(0.0, 0.0, 200, 100)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: screenWidth * 0.8,
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Consequat tempus rhoncus cum in. Vel id donec adipiscing elit morbi amet. Fermentum aliquam sed vitae placerat quam nec convallis.',
                              style: TextStyle(
                                color: Color(0xFFEFF1F4),
                                fontSize: 16,
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
          SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  alignment: WrapAlignment.center,
                  children: experiences.map((exp) {
                    return InfoCardWidget(
                      title: exp['title']!,
                      description: exp['description']!,
                      imageUrl: exp['imageUrl']!,
                      width: cardWidth,
                      height: cardHeight,
                      isFixedHeight: true, // إضافة هذا المتغير
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
