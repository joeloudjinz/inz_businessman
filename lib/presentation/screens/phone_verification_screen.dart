import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/main.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/phone_verification_vm.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SixteenPadding(
        child: PhoneVerificationScreenContent(),
      ),
    );
  }
}

class PhoneVerificationScreenContent extends StatelessWidget {
  final _assistant = locator<PhoneVerificationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerificationInformationCard(assistant: _assistant),
        CodeVerificationWidget(assistant: _assistant),
        AppDivider(),
        const Text('phone verification screen'),
        const MyNavigator(),
      ],
    );
  }
}

class CodeVerificationWidget extends HookWidget {
  final PhoneVerificationViewModel assistant;

  const CodeVerificationWidget({this.assistant});

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(phoneVerificationProvider);
    return Form(
      key: assistant.phoneVerificationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: Decorations.forIconTextField(
              Icons.mobile_friendly_rounded,
              "Code",
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
            autofocus: true,
            autocorrect: false,
            validator: (value) => assistant.validateCode(value),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: notifier.resendBtnStatus
                    ? () => assistant.resendPressed(notifier)
                    : null,
                child: const Text('Resend'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => assistant.submit(),
                child: const Text('Verify'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VerificationInformationCard extends HookWidget {
  final PhoneVerificationViewModel assistant;

  const VerificationInformationCard({this.assistant});

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(phoneVerificationProvider);
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: SimpleTimer(
                duration: Duration(seconds: notifier.timerSeconds),
                displayProgressIndicator: false,
                status: notifier.timerStatus,
                onEnd: () => assistant.onTimerEndEvent(notifier),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Phone Verification",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    "Enter the 6 digits you received in the SMS. if you didn't receive any click the resend button.",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyNavigator extends StatelessWidget {
  const MyNavigator({
    Key key,
  }) : super(key: key);

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
                .navigateTo("/second-registration-screen");
          },
          child: const Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
