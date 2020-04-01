// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:share_txt/ui/page/splash_screen_page.dart';
import 'package:share_txt/ui/page/login_page.dart';
import 'package:share_txt/ui/page/home_page.dart';

class Router {
  static const spleshScreenPage = '/';
  static const loginPage = '/login-page';
  static const homePage = '/home-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.spleshScreenPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SpleshScreenPage(),
          settings: settings,
        );
      case Router.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case Router.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
