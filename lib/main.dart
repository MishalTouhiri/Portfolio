import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishal/controllers/home_controller.dart';
import 'package:mishal/widgets/drawer_widget.dart';
import 'package:mishal/widgets/contact_section_widget.dart';
import 'package:mishal/widgets/experience_section_widget.dart';
import 'package:mishal/widgets/footer_widget.dart';
import 'package:mishal/widgets/header_widget.dart';
import 'package:mishal/widgets/home_section_widget.dart';
import 'package:mishal/widgets/projects_section_widget.dart';

void main() {
  Get.put(HomeController()); 
 WidgetsFlutterBinding.ensureInitialized();// لا داعي لـ permanent: false
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
  final HomeController controller = Get.find<HomeController>(); // استخدام Get.find بدلاً من Get.put

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161513),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            HeaderWidget(),
            Container(key: controller.sectionKeys['home'], child: HomeSectionWidget()),
            Container(key: controller.sectionKeys['projects'], child: ProjectsSectionWidget()),
            Container(key: controller.sectionKeys['experience'], child: ExperienceSectionWidget()),
            Container(key: controller.sectionKeys['contact'], child: ContactSectionWidget()),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
