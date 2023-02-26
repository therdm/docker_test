import 'package:get/get.dart';

import '../../../../presentation/third_page/controllers/third_page.controller.dart';

class ThirdPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThirdPageController>(
      () => ThirdPageController(),
    );
  }
}
