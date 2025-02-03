import 'package:flutter/material.dart';
import 'package:mishal/controllers/home_controller.dart';

import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF222222),
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Menu', style: TextStyle(color: Colors.white)),
          ),
          _buildNavButton('Home', 'home'),
          _buildNavButton('Projects', 'projects'),
          _buildNavButton('Experience', 'experience'),
          _buildNavButton('Contact', 'contact'),
        ],
      ),
    );
  }

  Widget _buildNavButton(String title, String section) {
    return TextButton(
      onPressed: () => Get.find<HomeController>().scrollTo(section),
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
