import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../services/session_service.dart';
import '../network/api_client.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // تسجيل الخدمات بـ Get.putAsync و Get.put(permanent)
    Get.putAsync(() => StorageService().init(), permanent: true);
    Get.put(SessionService(), permanent: true);
    Get.put(ApiClient(), permanent: true);
  }
}