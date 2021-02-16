import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/viewmodels/verification_vm.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final _assistant = locator<CodeVerificationViewModel>();

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

class CodeVerificationWidget extends StatelessWidget {
  final CodeVerificationViewModel assistant;
  final TextEditingController _editingController = TextEditingController();

  CodeVerificationWidget({this.assistant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: Decorations.forIconTextField(
            Icons.mobile_friendly_rounded,
            "Code",
          ),
          controller: _editingController,
          keyboardType: TextInputType.number,
          maxLength: 6,
          autofocus: true,
          autocorrect: false,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, watch, child) {
                final notifier = watch(assistant.provider);
                return ElevatedButton(
                  onPressed: notifier.resendBtnStatus
                      ? () {
                          notifier.reStartTimer();
                          notifier.disableResendBtn();
                        }
                      : null,
                  child: const Text('Resend Token'),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Verify'),
            ),
          ],
        ),
      ],
    );
  }
}

class VerificationInformationCard extends StatelessWidget {
  final CodeVerificationViewModel assistant;

  const VerificationInformationCard({this.assistant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // timer
            Consumer(
              builder: (context, watch, child) {
                final notifier = watch(assistant.provider);
                return Expanded(
                  child: SimpleTimer(
                    duration: Duration(seconds: notifier.timerSeconds),
                    displayProgressIndicator: false,
                    status: notifier.timerStatus,
                    onEnd: () {
                      notifier.enableResendBtn();
                      notifier.resetTimer();
                    },
                  ),
                );
              },
            ),
            // texts
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
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  // AppDivider(),
                  const Text(
                    "Enter the 6 digits you received in the SMS. if you didn't receive any click the resend button.",
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
