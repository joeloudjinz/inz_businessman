import 'package:auto_route/auto_route_annotations.dart';
import 'package:businessman/presentation/screens/home_screen.dart';
import 'package:businessman/presentation/screens/login_screen.dart';
import 'package:businessman/presentation/screens/phone_registration_screen.dart';
import 'package:businessman/presentation/screens/phone_verification_screen.dart';
import 'package:businessman/presentation/screens/second_registration_screen.dart';
import 'package:businessman/presentation/screens/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: PhoneRegistrationScreen, name: "phoneRegistration"),
    MaterialRoute(page: PhoneVerificationScreen, name: "phoneVerification"),
    MaterialRoute(page: SecondRegistrationScreen, name: "secondRegistration"),
    MaterialRoute(page: LoginScreen, name: "loginScreen"),
    MaterialRoute(page: HomeScreen, name: "homeScreen"),
  ],
)
class $Router {}
