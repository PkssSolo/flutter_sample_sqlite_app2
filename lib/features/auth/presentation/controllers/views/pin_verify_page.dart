import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pin_controller.dart';

class PinVerifyPage extends GetView<PinController> {
  const PinVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شاشة حماية PIN')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text('يرجى إدخال رمز PIN للمتابعة (الافتراضي: 1234)', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            TextField(
              controller: controller.pinController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, letterSpacing: 8),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.verifyPin,
              child: const Text('تحقق والدخول'),
            ),
            TextButton(
              onPressed: controller.showSetPinDialog,
              child: const Text('تعيين/تغيير رمز PIN'),
            ),
          ],
        ),
      ),
    );
  }
}