import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'title': 'نظام المصادقة والتنظيم',
          'home': 'الرئيسية',
          'settings': 'الإعدادات',
          'dark_mode': 'الوضع الليلي',
          'language': 'لغة التطبيق',
          'set_pin': 'تعيين رمز PIN',
          'verify_pin': 'التحقق من رمز PIN',
        },
        'en': {
          'title': 'Auth & Management System',
          'home': 'Home',
          'settings': 'Settings',
          'dark_mode': 'Dark Mode',
          'language': 'App Language',
          'set_pin': 'Set PIN',
          'verify_pin': 'Verify PIN',
        },
      };
}