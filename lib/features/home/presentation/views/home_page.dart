import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../core/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutes.settings),
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => Get.toNamed('${AppRoutes.about}/profile-section'), // مسار ديناميكي
          ),
        ],
      ),
      // استخدام StateMixin (controller.obx)
      body: controller.obx(
        (state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state ?? '', style: const TextStyle(color: Colors.green)),
              const SizedBox(height: 20),
              const Text('قيمة العداد باستخدام GetBuilder:', style: TextStyle(fontSize: 16)),
              // استخدام GetBuilder مع id محدد
              GetBuilder<HomeController>(
                id: 'counter_id',
                builder: (ctrl) => Text(
                  '${ctrl.count.value}',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.increment,
                child: const Text('زيادة العداد (Update ID)'),
              ),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (err) => Center(child: Text('خطأ: $err')),
      ),
    );
  }
}