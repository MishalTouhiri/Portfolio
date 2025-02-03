import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  void scrollTo(String section) {
    double offset = 0;
    switch (section) {
      case 'projects':
        offset = 600;
        break;
      case 'experience':
        offset = 1200;
        break;
      case 'contact':
        offset = 1800;
        break;
      default:
        offset = 0;
    }
    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
