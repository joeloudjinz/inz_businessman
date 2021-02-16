import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class PhoneVerificationState extends ChangeNotifier {
  bool resendBtnStatus = false;
  TimerStatus timerStatus = TimerStatus.start;
  int timerSeconds = 5;

  enableResendBtn() {
    resendBtnStatus = true;
    notifyListeners();
  }

  disableResendBtn() {
    resendBtnStatus = false;
    notifyListeners();
  }

  resetTimer() {
    timerStatus = TimerStatus.reset;
    notifyListeners();
  }

  reStartTimer() {
    timerSeconds += 5;
    timerStatus = TimerStatus.start;
    notifyListeners();
  }
}
