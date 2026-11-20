import 'package:get/get.dart';
import '../middleware/pin_guard_middleware.dart';
import 'app_routes.dart';
import '../../features/auth/presentation/views/pin_verify_page.dart';
import '../../features/auth/presentation/controllers/pin_controller.dart';
import '../../features/home/presentation/views/home_page.dart';
import '../../features/home/presentation/controllers/home_controller.dart';
import '../../features/home/presentation/views/about_page.dart';
import '../../features/home/presentation/controllers/about_controller.dart';
import '../../features/settings/presentation/views/settings_page.dart';
import '../../features/settings/presentation/controllers/settings_controller.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/home/presentation/views/not_found_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.pinVerify,
      page: () => const PinVerifyPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => PinController())),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController(), fenix: true);
      }),
      middlewares: [PinGuardMiddleware()], // حماية المسار
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsPage(),
      binding: BindingsBuilder(() {
        // ربط المعمارية النظيفة لميزة الإعدادات
        Get.lazyPut<SettingsRepository>(() => SettingsRepositoryImpl(Get.find()));
        Get.lazyPut(() => SettingsController(Get.find()));
      }),
      middlewares: [PinGuardMiddleware()], // حماية المسار
    ),
    // مسار ديناميكي /about/:section
    GetPage(
      name: '${AppRoutes.about}/:section',
      page: () => const AboutPage(),
      binding: BindingsBuilder(() => Get.lazyPut(() => AboutController())),
    ),
  ];

  static final unknownRoute = GetPage(
    name: '/404',
    page: () => const NotFoundPage(),
  );
}