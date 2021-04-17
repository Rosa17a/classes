import 'package:flutter/material.dart';

class AppKeys {
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
}

class GlobalContext {
  static BuildContext get context =>
      AppKeys.navigatorkey.currentState!.overlay!.context;
}