import 'package:flutter/material.dart';

class HomeSectionWidget extends StatefulWidget {
  @override
  _HomeSectionWidgetState createState() => _HomeSectionWidgetState();
}

class _HomeSectionWidgetState extends State<HomeSectionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<IconData> skillsIcons = [
    Icons.code,
    Icons.computer,
    Icons.file_copy,
    Icons.pets,
    Icons.storage,
    Icons.flutter_dash,
    Icons.javascript,
    Icons.language,
    Icons.format_color_fill,
    Icons.code_sharp,
    Icons.cloud_upload,
    Icons.business_center,
    Icons.assignment,
    Icons.security,
    Icons.cloud,
    Icons.android,
    Icons.web,
    Icons.group,
    Icons.cloud_circle,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600 ? 4 : (screenWidth < 1000 ? 6 : 10);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 251,
              height: 223,
              child: Stack(
                children: [
                  Positioned(
                    left: 9,
                    top: 9,
                    child: Container(
                      width: 213,
                      height: 213,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.67, -0.74),
                          end: Alignment(-0.67, 0.74),
                          colors: [Color(0xFFFF855F), Color(0xFF8000FE)],
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 9,
                    top: 9,
                    child: ClipOval(
                      child: Image.asset(
                        'images/m.jpg',
                        width: 213,
                        height: 213,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 33),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'I design intuitive user interfaces and create engaging ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 1.50,
                      ),
                    ),
                    TextSpan(
                      text: 'experiences for users!',
                      style: TextStyle( 
                        color: Color(0xFFFF8660),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 1.50,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'I am a creative professional specializing in strategy, branding, and UI/UX design. I help businesses define their direction, craft compelling brand identities, and design user-friendly interfaces to enhance user satisfaction and engagement.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Navigating to Get In Touch Page");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    'Get In Touch',
                    style: TextStyle(
                      color: Color(0xFF161513),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Navigating to Download CV");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(width: 2, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    'Download CV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Skills',
                style: TextStyle(
                  color: Color(0xFFC4C4C4),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 100,
                    mainAxisSpacing: 100,
                    childAspectRatio: 1,
                  ),
                  itemCount: skillsIcons.length,
                  itemBuilder: (context, index) {
                    return Icon(
                      skillsIcons[index],
                      size: 40,
                      color: Color(0xFFC4C4C4),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
