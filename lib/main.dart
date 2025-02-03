import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishal/widgets/drawer_widget.dart';

import 'controllers/home_controller.dart';
import 'widgets/contact_section_widget.dart';
import 'widgets/experience_section_widget.dart';
import 'widgets/footer_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/home_section_widget.dart';
import 'widgets/projects_section_widget.dart';

void main() {
  Get.put(HomeController(), permanent: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mishal Touhri',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161513),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  HomeSectionWidget(),
                  ProjectsSectionWidget(),
                  ExperienceSectionWidget(),
                  ContactSectionWidget(),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
