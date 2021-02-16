import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/widgets/cards/basic_card.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SixteenPadding(child: PhoneRegistrationScreenContent()),
    );
  }
}

class PhoneRegistrationScreenContent extends StatelessWidget {
  final String cardTitle = "Phone Registration";
  final String cardBody =
      "we start with your phone number, it is crucial for running your business smoothly so make sure to provide a valid one.";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicCard(
          title: cardTitle,
          body: cardBody,
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
  final phoneRegistrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: phoneRegistrationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhoneField(),
          ElevatedButton(
            onPressed: () {
              if (phoneRegistrationFormKey.currentState.validate()) {
                return;
              }
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  String validate(String value) {
    if (value.isEmpty) return "should not be empty";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: Decorations.forIconTextField(Icons.phone_rounded, "phone"),
        validator: (value) => validate(value),
      ),
    );
  }
}

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.grey, fontSize: 10.0),
        children: <TextSpan>[
          const TextSpan(text: 'By clicking next, you agree to our '),
          TextSpan(
              text: 'Terms of Service',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Terms of Service"');
                }),
          const TextSpan(text: ' and that you have read our '),
          TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Privacy Policy"');
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
