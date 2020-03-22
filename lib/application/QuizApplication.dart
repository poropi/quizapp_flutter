import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/ui/screen/title/TitleScreenPage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/ui/screen/title/TitleScreenPageStore.dart';
import 'package:quizapp/utils/SoundUtils.dart';

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class QuizApplication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    SoundUtils.initSound();
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TitleScreenPageStore(),
        child: TitleScreenPage(),
      ),
    );
  }
}
