import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/second_registration_vm.dart';
import 'package:businessman/presentation/widgets/cards/basic_card.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SixteenPadding(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: SecondRegistrationScreenContent(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondRegistrationScreenContent extends StatelessWidget {
  final String cardTitle = "Final Registration";
  final String cardBody =
      "The final step at this journey, provide the necessary information about you and you are ready to grow your business.";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BasicCard(
          title: cardTitle,
          body: cardBody,
        ),
        FinalRegistrationFormWidget(),
        AppDivider(),
        const Text('final registration screen'),
        MyNavigator(),
      ],
    );
  }
}

class FinalRegistrationFormWidget extends StatefulWidget {
  @override
  _FinalRegistrationFormWidgetState createState() =>
      _FinalRegistrationFormWidgetState();
}

class _FinalRegistrationFormWidgetState
    extends State<FinalRegistrationFormWidget> {
  final SecondRegistrationViewModel assistant =
      locator<SecondRegistrationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: assistant.secondRegistrationFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              decoration: Decorations.forIconTextField(
                  Icons.account_box_rounded, "full name"),
              validator: (value) => assistant.validateFullName(value),
              autofocus: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  Decorations.forIconTextField(Icons.email_rounded, "email"),
              validator: (value) => assistant.validateEmail(value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              obscureText: true,
              decoration:
                  Decorations.forIconTextField(Icons.lock_rounded, "password"),
              validator: (value) => assistant.validatePassword(value),
            ),
          ),
          ElevatedButton(
            onPressed: () => assistant.submit(),
            child: const Text("Let's go"),
          ),
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
            locator<NavigationService>().navigateTo("/home-screen");
          },
          child: const Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
