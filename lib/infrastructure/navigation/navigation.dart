import 'package:docker_test/presentation/fourth_page/controllers/fourth_page.controller.dart';
import 'package:docker_test/presentation/home/controllers/home.controller.dart';
import 'package:docker_test/presentation/second_page/controllers/second_page.controller.dart';
import 'package:docker_test/presentation/third_page/controllers/third_page.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static GoRouter goRoutes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.HOME,
        builder: (context, state) {
          HomeControllerBinding().dependencies();
          printState<HomeController>(state);
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.SECOND_PAGE,
        builder: (context, state) {
          // SecondPageControllerBinding().dependencies();
          // printState<SecondPageController>(state);
          return const SecondPageScreen();
        },
      ),
      GoRoute(
        path: Routes.THIRD_PAGE,
        builder: (context, state) {
          ThirdPageControllerBinding().dependencies();
          printState<ThirdPageController>(state);
          return const ThirdPageScreen();
        },
      ),
      GoRoute(
        path: Routes.FOURTH_PAGE,
        builder: (context, state) {
          FourthPageControllerBinding().dependencies();
          printState<FourthPageController>(state);
          return const FourthPageScreen();
        },
      ),
    ],
  );
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SECOND_PAGE,
      page: () => const SecondPageScreen(),
      binding: SecondPageControllerBinding(),
    ),
    GetPage(
      name: Routes.THIRD_PAGE,
      page: () => const ThirdPageScreen(),
      binding: ThirdPageControllerBinding(),
    ),
    GetPage(
      name: Routes.FOURTH_PAGE,
      page: () => const FourthPageScreen(),
      binding: FourthPageControllerBinding(),
    ),
  ];
}
String? prevPrevPage;
String? prevPage;
String? currentPage;

Type? prevType;
Type? currentType;

printState<S>(GoRouterState state) {
  // print('[PAGEKEY] ${state.pageKey}');
  // print('[FULLPATH] ${state.fullpath}');


  prevPrevPage = prevPage;
  prevPage = currentPage;
  currentPage = state.pageKey.toString();

  prevType = currentType;
  currentType = S;
  print('COMPARING $prevPrevPage AND $currentPage');
  if(prevPrevPage == currentPage){
    print('TIME TO DELETE $prevType');
    if(prevType != null) {
      // Get.delete<prevType>();
    }
  } else {

  }
}

