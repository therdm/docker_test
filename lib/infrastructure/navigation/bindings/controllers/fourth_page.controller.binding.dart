import 'package:get/get.dart';

import '../../../../presentation/fourth_page/controllers/fourth_page.controller.dart';

class FourthPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FourthPageController>(
      () => FourthPageController(),
    );
  }
}
