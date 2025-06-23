import 'package:flutter/material.dart';

class MyAppConfig extends InheritedWidget {
  final String flavor;
  const MyAppConfig({required this.flavor, required Widget child, super.key})
    : super(child: child);

  static MyAppConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyAppConfig>();

  @override
  bool updateShouldNotify(MyAppConfig oldWidget) => flavor != oldWidget.flavor;
}
