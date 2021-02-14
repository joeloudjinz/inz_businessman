// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/phone_registration_screen.dart';
import '../../presentation/screens/phone_verification_screen.dart';
import '../../presentation/screens/second_registration_screen.dart';
import '../../presentation/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String phoneRegistration = '/phone-registration-screen';
  static const String phoneVerification = '/phone-verification-screen';
  static const String secondRegistration = '/second-registration-screen';
  static const String loginScreen = '/login-screen';
  static const String homeScreen = '/home-screen';
  static const all = <String>{
    splashScreen,
    phoneRegistration,
    phoneVerification,
    secondRegistration,
    loginScreen,
    homeScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.phoneRegistration, page: PhoneRegistrationScreen),
    RouteDef(Routes.phoneVerification, page: PhoneVerificationScreen),
    RouteDef(Routes.secondRegistration, page: SecondRegistrationScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    PhoneRegistrationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhoneRegistrationScreen(),
        settings: data,
      );
    },
    PhoneVerificationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PhoneVerificationScreen(),
        settings: data,
      );
    },
    SecondRegistrationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SecondRegistrationScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },
  };
}
