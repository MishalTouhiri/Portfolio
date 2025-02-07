import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;

  final Map<String, GlobalKey> sectionKeys = {
    'home': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  void scrollTo(String section) {
    if (!scrollController.hasClients) return;

    final key = sectionKeys[section];
    if (key == null || key.currentContext == null) return;

    // ✅ يضمن أن التمرير يحدث فقط بعد اكتمال بناء الواجهة
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
