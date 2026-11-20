import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/session_service.dart';
import '../../../../core/services/storage_service.dart';

class PinController extends GetxController {
  final pinController = TextEditingController();

  // تعيين رمز PIN عبر Get.defaultDialog باستخدام GetUtils
  void showSetPinDialog() {
    pinController.clear();
    Get.defaultDialog(
      title: 'تعيين رمز PIN جديد',
      content: TextField(
        controller: pinController,
        keyboardType: TextInputType.number,
        maxLength: 4,
        obscureText: true,
        decoration: const InputDecoration(hintText: 'أدخل 4 أرقام'),
      ),
      textConfirm: 'حفظ',
      onConfirm: () {
        if (GetUtils.isNumericOnly(pinController.text) && pinController.text.length == 4) {
          final storage = Get.find<StorageService>();
          storage.savePinCode(pinController.text);
          Get.back();
          Get.snackbar('نجاح', 'تم حفظ رمز PIN بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
        } else {
          Get.snackbar('خطأ', 'يجب أن يكون الرمز 4 أرقام حصراً', backgroundColor: Colors.red, colorText: Colors.white);
        }
      },
    );
  }

  // التحقق من رمز PIN
  void verifyPin() {
    final storage = Get.find<StorageService>();
    final session = Get.find<SessionService>();

    if (storage.savedPin.value.isEmpty) {
      // لو لم يتم تعيين PIN مسبقاً، نعتبر الافتراضي 1234 أو نطلب تعيينه
      storage.savePinCode('1234');
    }

    if (pinController.text == storage.savedPin.value) {
      session.verifySession();
      Get.offAllNamed('/home');
      Get.snackbar('مرحباً', 'تم التحقق من الحماية بنجاح', backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('خطأ', 'رمز PIN غير صحيح', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}