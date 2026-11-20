import 'package:get/get.dart';

class SessionService extends GetxService {
  final RxBool isPinVerified = false.obs;

  void verifySession() => isPinVerified.value = true;
  void clearSession() => isPinVerified.value = false;
}