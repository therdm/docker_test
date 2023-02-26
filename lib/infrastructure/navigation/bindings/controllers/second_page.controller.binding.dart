import 'package:get/get.dart';

import '../../../../presentation/second_page/controllers/second_page.controller.dart';

class SecondPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondPageController>(
      () => SecondPageController(),
    );
  }
}
