import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // إعدادات الثيم (Dark/Light) عبر .obs و Obx
          Obx(() => SwitchListTile(
                title: Text('dark_mode'.tr),
                value: controller.isDark.value,
                onChanged: (val) => controller.isDark.value = val,
              )),
          const Divider(),
          // اختيار اللغة عبر Get.bottomSheet
          ListTile(
            title: Text('language'.tr),
            trailing: Obx(() => Text(controller.selectedLang.value.toUpperCase())),
            onTap: () {
              Get.bottomSheet(
                Container(
                  color: Get.theme.cardColor,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('العربية (AR)'),
                        onTap: () {
                          controller.changeLanguage('ar');
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: const Text('English (EN)'),
                        onTap: () {
                          controller.changeLanguage('en');
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}