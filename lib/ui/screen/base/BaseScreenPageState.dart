import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/application/QuizApplication.dart';

abstract class BaseScreenPageState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver, RouteAware {

  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  ChangeNotifier store;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _assetsAudioPlayer.dispose();
        _assetsAudioPlayer.playlistFinished.listen((event) {
          if (!Navigator.canPop(context)) {
            SystemNavigator.pop(animated: true);
          } else {
            Navigator.pop(context);
          }
        });
        return Future(() => false);
      },
      child: getScreenPageLayout(context)
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _assetsAudioPlayer.pause();
    } else if (state == AppLifecycleState.resumed) {
      _assetsAudioPlayer.play();
    }
    debugPrint("hirosawa test state = $state");
  }

  // この画面がpushされたときに呼ばれます
  void didPush() {
    debugPrint("hirosawa test didPush ${runtimeType}");
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(Audio(getAudioFile()));
    _assetsAudioPlayer.loop = true;
    _assetsAudioPlayer.play();
  }

  // この画面がpopされたときに呼ばれます
  void didPop() {
    _assetsAudioPlayer.dispose();
    debugPrint("hirosawa test didPop ${runtimeType}");
  }

  // 上の画面がpopされて、この画面に戻ったときに呼ばれます
  void didPopNext() {
    debugPrint("hirosawa test didPopNext ${runtimeType}");
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(Audio(getAudioFile()));
    _assetsAudioPlayer.loop = true;
    _assetsAudioPlayer.play();
  }

  // この画面から新しい画面をpushしたときに呼ばれます
  void didPushNext() {
    _assetsAudioPlayer.pause();
    debugPrint("hirosawa test didPushNext ${runtimeType}");
  }

  String getAudioFile();

  Widget getScreenPageLayout(context);

}
