import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/main.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/login_vm.dart';
import 'package:businessman/presentation/widgets/cards/basic_card.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/scrollable_scaffold_body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final LoginViewModel assistant = locator<LoginViewModel>();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    assistant.prepareL10N(context);
    return Scaffold(
      body: ScaffoldBodyHolder(
        child: LoginScreenContent(),
      ),
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicCard(
          title: 'Login',
          body: assistant.l10n.greetingCardBody,
        ),
        LoginForm(),
        ToRegistrationScreenWidget(),
        AppDivider(),
        LanguageSwitcherWidget(),
        AppDivider(),
        const Text('login screen'),
        MyNavigation(),
      ],
    );
  }
}

class LanguageSwitcherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.caption,
        children: [
          TextSpan(
            text: 'العربية',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.read(localizationProvider).toArabic(),
          ),
          const TextSpan(text: " | "),
          TextSpan(
            text: 'Français',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.read(localizationProvider).toFrench(),
          ),
          const TextSpan(text: " | "),
          TextSpan(
            text: 'English',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.read(localizationProvider).toEnglish(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
          key: assistant.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: Decorations.forIconTextField(
                      Icons.email_rounded, assistant.l10n.emailLabel),
                  validator: (value) => assistant.validateEmail(value),
                  autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: Decorations.forIconTextField(
                      Icons.lock_rounded, assistant.l10n.passwordLabel),
                  validator: (value) => assistant.validatePassword(value),
                ),
              ),
              ElevatedButton(
                onPressed: () => assistant.submit(),
                child: Text(assistant.l10n.loginButtonLabel),
              ),
            ],
          )),
    );
  }
}

class ToRegistrationScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: RichText(
        text: TextSpan(
          // style: const TextStyle(color: Colors.grey, fontSize: 10.0),
          style: Theme.of(context).textTheme.caption,
          children: <TextSpan>[
            TextSpan(text: assistant.l10n.noAccountText),
            TextSpan(
              text: assistant.l10n.startBusinessText,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => assistant.navigator
                    .navigateTo("/phone-registration-screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          child: const Icon(Icons.arrow_left_rounded),
        ),
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>()
                .navigateTo("/phone-registration-screen");
          },
          child: const Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
