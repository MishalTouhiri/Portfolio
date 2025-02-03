import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        return Container(
          height: 80,
          color: Color(0xFF222222),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/m.jpg', width: 64),
              if (isSmallScreen)
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
              else
                Row(
                  children: [
                    _buildNavButton('Home', 'home'),
                    _buildNavButton('Projects', 'projects'),
                    _buildNavButton('Experience', 'experience'),
                    _buildNavButton('Contact', 'contact'),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavButton(String title, String section) {
    return TextButton(
      onPressed: () => Get.find<HomeController>().scrollTo(section),
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
