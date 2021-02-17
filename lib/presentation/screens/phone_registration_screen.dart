import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/phone_registration_vm.dart';
import 'package:businessman/presentation/widgets/cards/basic_card.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

final PhoneRegistrationViewModel assistant =
    locator<PhoneRegistrationViewModel>();

class PhoneRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SixteenPadding(child: PhoneRegistrationScreenContent()),
    );
  }
}

class PhoneRegistrationScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    assistant.prepareL10N(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicCard(
          title: assistant.l10n.phoneRegistrationCardTitle,
          body: assistant.l10n.phoneRegistrationCardBody,
        ),
        PhoneRegistrationForm(),
        AppDivider(),
        AgreementText(),
        AppDivider(),
        const Text('phone registration screen'),
        MyNavigator(),
      ],
    );
  }
}

class PhoneRegistrationForm extends StatefulWidget {
  @override
  _PhoneRegistrationFormState createState() => _PhoneRegistrationFormState();
}

class _PhoneRegistrationFormState extends State<PhoneRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: assistant.phoneRegistrationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: Decorations.forIconTextField(
                Icons.phone_rounded,
                assistant.l10n.phoneLabel,
              ),
              validator: (value) => assistant.processValue(value),
            ),
          ),
          ElevatedButton(
            onPressed: assistant.submit,
            child: Text(
              assistant.l10n.verifyPhoneButtonLabel,
            ),
          ),
        ],
      ),
    );
  }
}

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.caption,
        children: <TextSpan>[
          TextSpan(text: assistant.l10n.agreementTextPart1),
          TextSpan(
              text: assistant.l10n.termsOfService,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //TODO: implement terms of service page for businessman
                }),
          TextSpan(text: assistant.l10n.agreementTextPart2),
          TextSpan(
              text: assistant.l10n.privacyPolicy,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //TODO: implement privacy policy page for businessman
                }),
        ],
      ),
    );
  }
}

class MyNavigator extends StatelessWidget {
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
                .navigateTo("/phone-verification-screen");
          },
          child: const Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
