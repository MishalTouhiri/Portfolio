import 'package:flutter/material.dart';
import 'package:mishal/Custom%20Widget/CustomCardWidget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      "title": "Project 1",
      "description": "This is a short description of project 1.",
      "imageUrl": "images/m.jpg"
    },
    {
      "title": "Project 2",
      "description": "A brief description for project 2 that fits within the card.",
      "imageUrl": "images/m.jpg"
    },
    {
      "title": "Project 3",
      "description": "A concise summary of project 3. Designed to stay within bounds.",
      "imageUrl": "images/m.jpg"
    },
    {
      "title": "Project 4",
      "description": "Short project description to prevent overflow.",
      "imageUrl": "images/m.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // تكبير الكروت في الكمبيوتر
    double cardWidth = screenWidth > 900 ? screenWidth * 0.2 : screenWidth * 0.4;
    double cardHeight = screenWidth > 900 ? 550 : 350;
    double spacing = screenWidth > 600 ? 60 : 40; // مسافة بين الكروت

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
                                '    Look at My',
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
                                  text: 'Projects.',
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
                                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200, 100)),
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
              bool isDesktop = constraints.maxWidth > 900;

              return isDesktop
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // توازن المسافة بين اليمين واليسار
                      child: Wrap(
                        spacing: spacing, // المسافة الأفقية بين الكروت
                        runSpacing: spacing, // المسافة العمودية بين الكروت
                        alignment: WrapAlignment.center, // توسيط العناصر
                        children: projects.map((project) {
                          return CustomCardWidget(
                            title: project['title']!,
                            description: project['description']!,
                            imageUrl: project['imageUrl']!,
                            width: cardWidth,
                            height: cardHeight,
                            isFixedHeight: true,
                          );
                        }).toList(),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 50),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth < 500 ? 1 : 2,
                            crossAxisSpacing: spacing,
                            mainAxisSpacing: spacing,
                            childAspectRatio: cardWidth / cardHeight,
                          ),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return CustomCardWidget(
                              title: projects[index]['title']!,
                              description: projects[index]['description']!,
                              imageUrl: projects[index]['imageUrl']!,
                              width: cardWidth,
                              height: cardHeight,
                              isFixedHeight: true,
                            );
                          },
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
