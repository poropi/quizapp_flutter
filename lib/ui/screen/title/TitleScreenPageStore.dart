import 'package:flutter/material.dart';
import 'package:quizapp/utils/SoundUtils.dart';

class TitleScreenPageStore with ChangeNotifier {
  var isBlink = false;

  void changeBlink() {
    isBlink = !isBlink;
    notifyListeners();
  }

  void doPushSound() {
    SoundUtils.doPushSound();
  }

}