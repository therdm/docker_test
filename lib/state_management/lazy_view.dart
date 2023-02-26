import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LazyView<T> extends StatelessWidget {
  const LazyView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag)!;


  @override
  Widget build(BuildContext context);
}
