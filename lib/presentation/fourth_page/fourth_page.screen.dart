import 'package:docker_test/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/fourth_page.controller.dart';

class FourthPageScreen extends GetView<FourthPageController> {
  const FourthPageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FourthPageScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${controller.count.value} FourthScreen is working',
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
