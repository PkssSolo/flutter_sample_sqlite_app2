import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsController extends GetxController {
  final SettingsRepository _settingsRepository;

  SettingsController(this._settingsRepository);

  final RxBool isDark = false.obs;
  final RxString selectedLang = 'ar'.obs;

  @override
  void onClose() {
    // Worker (ever) للمراقبة والتحديث التلقائي
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    isDark.value = _settingsRepository.getThemeMode();
    selectedLang.value = _settingsRepository.getLanguage();

    // مراقبة الثيم عبر ever وتطبيق التغيير الفوري
    ever(isDark, (dark) {
      _settingsRepository.saveThemeMode(dark);
      Get.changeThemeMode(dark ? ThemeMode.dark : ThemeMode.light);
    });
  }

  void changeLanguage(String lang) {
    selectedLang.value = lang;
    _settingsRepository.saveLanguage(lang);
    Get.updateLocale(Locale(lang));
  }
}