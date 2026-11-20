import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';

class PinGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final session = Get.find<SessionService>();
    // إذا لم يتم التحقق من الـ PIN، يتم توجيهه لشاشة إدخال الـ PIN
    if (!session.isPinVerified.value) {
      return const RouteSettings(name: '/pin-verify');
    }
    return null;
  }
}