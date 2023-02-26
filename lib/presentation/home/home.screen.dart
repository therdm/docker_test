import 'package:docker_test/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.SECOND_PAGE);
              },
              child: Text('Go to next page'),
            ),
          ],
        ),
      ),
    );
  }
}



