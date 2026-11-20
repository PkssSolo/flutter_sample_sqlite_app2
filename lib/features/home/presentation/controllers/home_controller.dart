import 'package:get/get.dart';

// استخدام StateMixin لعرض حالات (Loading, Success, Error)
class HomeController extends GetxController with StateMixin<String> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 1), () {
      change("بيانات الصفحة الرئيسية جاهزة", status: RxStatus.success());
    });
  }

  void increment() {
    count.value++;
    update(['counter_id']); // استخدام GetBuilder مع update([id])
  }
}