import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/about_controller.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة حول النظام')),
      body: Center(
        child: Text(
          'أهلاً بك في القسم الديناميكي: ${controller.sectionName}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}