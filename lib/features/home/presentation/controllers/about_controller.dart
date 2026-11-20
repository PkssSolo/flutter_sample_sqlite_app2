import 'package:get/get.dart';

class AboutController extends GetxController {
  String sectionName = '';

  @override
  void onInit() {
    super.onInit();
    // قراءة البارامتر الديناميكي عبر Get.parameters
    sectionName = Get.parameters['section'] ?? 'عام';
  }
}