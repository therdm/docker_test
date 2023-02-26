import 'package:docker_test/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/third_page.controller.dart';

class ThirdPageScreen extends GetView<ThirdPageController> {
  const ThirdPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdPageScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${controller.count.value} ThirdScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.FOURTH_PAGE);
              },
              child: Text('Go to next page'),
            ),
          ],
        ),
      ),
    );
  }
}
