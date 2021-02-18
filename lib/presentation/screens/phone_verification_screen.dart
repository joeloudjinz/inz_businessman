import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/main.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/phone_verification_vm.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:stacked_services/stacked_services.dart';

final PhoneVerificationViewModel assistant =
    locator<PhoneVerificationViewModel>();

class PhoneVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    assistant.prepareL10N(context);
    return Scaffold(
      body: SixteenPadding(
        child: PhoneVerificationScreenContent(),
      ),
    );
  }
}

class PhoneVerificationScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerificationInformationCard(),
        CodeVerificationWidget(),
        AppDivider(),
        const Text('phone verification screen'),
        MyNavigator(),
      ],
    );
  }
}

class CodeVerificationWidget extends HookWidget {
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
              assistant.l10n.verificationCodeLabel,
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
                child: Text(assistant.l10n.resendButtonLabel),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => assistant.submit(),
                child: Text(assistant.l10n.verifyPhoneButtonLabel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VerificationInformationCard extends HookWidget {
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
                      assistant.l10n.phoneVerificationCardTitle,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    assistant.l10n.phoneVerificationCardBody,
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
