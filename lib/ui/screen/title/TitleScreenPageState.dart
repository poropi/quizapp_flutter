import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/ui/screen/base/BaseScreenPageState.dart';
import 'package:quizapp/ui/screen/title/TitleScreenPage.dart';
import 'package:quizapp/ui/screen/title/TitleScreenPageLayout.dart';
import 'package:quizapp/ui/screen/title/TitleScreenPageStore.dart';

class TitleScreenPageState extends BaseScreenPageState<TitleScreenPage> with WidgetsBindingObserver {

  TitleScreenPageState(): super() {
    Timer.periodic(Duration(milliseconds: 600), (timer) {
      (super.store as TitleScreenPageStore)?.changeBlink();
    });
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  String getAudioFile() {
    return "assets/audio/001quizmusic.mp3";
  }

  @override
  Widget getScreenPageLayout(context) {
    return Consumer<TitleScreenPageStore>(
        builder: (context, store, _) {
          this.store = store;
          return getTitleScreenPageLayout(context, store);
        });
  }
}
