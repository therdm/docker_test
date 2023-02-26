import 'package:docker_test/infrastructure/navigation/routes.dart';
import 'package:docker_test/state_management/lazy_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/second_page.controller.dart';

class SecondPageScreen extends GetView<SecondPageController> {
  const SecondPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPageScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${controller.count.value} SecondScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.THIRD_PAGE);
              },
              child: Text('Go to next page'),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class LazyView<T> extends StatelessWidget {
  const LazyView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context);
}

// class LazyView<T> extends StatelessWidget {
//   const LazyView({Key? key, this.onWillPop, required this.child}) : super(key: key);
//   final Future<bool> Function()? onWillPop;
//   final Widget child;
//
//   final String? tag = null;
//
//   T get controller => GetInstance().find<T>(tag: tag)!;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         Get.delete<SecondPageController>();
//         return onWillPop?.call() ?? Future.value(true);
//       },
//       child: child,
//     );
//   }
// }
