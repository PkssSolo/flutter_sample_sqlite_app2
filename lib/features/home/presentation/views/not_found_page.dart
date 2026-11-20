import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خطأ 404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('عذراً، الصفحة المطلوبة غير موجودة!', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed('/home'),
              child: const Text('العودة للرئيسية'),
            ),
          ],
        ),
      ),
    );
  }
}