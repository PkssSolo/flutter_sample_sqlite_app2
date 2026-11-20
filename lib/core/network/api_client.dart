import 'package:get/get.dart';
import 'package:get/get_connect.dart';

// ApiClient يرث GetConnect ومسجل كخدمة (جاهز لأسبوع 5)
class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.student-system.edu';
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }
}