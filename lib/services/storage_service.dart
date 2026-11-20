import 'package:get/get.dart';

// محاكاة GetStorage أو التخزين المحلي كـ GetxService
class StorageService extends GetxService {
  final RxBool isDarkMode = false.obs;
  final RxString currentLang = 'ar'.obs;
  final RxString savedPin = ''.obs;

  Future<StorageService> init() async {
    // محاكاة جلب البيانات من التخزين المحلي
    return this;
  }

  void saveTheme(bool isDark) => isDarkMode.value = isDark;
  void saveLang(String lang) => currentLang.value = lang;
  void savePinCode(String pin) => savedPin.value = pin;
}