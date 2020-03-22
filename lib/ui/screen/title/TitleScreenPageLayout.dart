import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/ui/MyHomePage.dart';
import 'package:quizapp/utils/CommonUtils.dart';
import 'TitleScreenPageStore.dart';

Widget getTitleScreenPageLayout(BuildContext context, TitleScreenPageStore titleScreenPageStore) {
  return Scaffold(
    body: Center(
        child: GestureDetector(
          onTap: (){
            titleScreenPageStore.doPushSound();
            Navigator.push(context, MaterialPageRoute<Null>(
              settings: const RouteSettings(name: "/menu"),
              builder: (context) => MyHomePage(title: "aaaa",)
            ));
          },
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: smallestScreenWidthSize(context),
                      height: smallestScreenWidthSize(context),
                      child: SvgPicture.asset('assets/images/title_woman_image_001.svg',
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          colorBlendMode: BlendMode.modulate),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: smallestScreenWidthSize(context),
                    height: smallestScreenWidthSize(context),
                    margin: EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/logo.png',
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: titleScreenPageStore.isBlink? 0.0: 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text('Touch Start',
                      style: Theme.of(context).textTheme.headline4,
                    ),)
                ],
              ),
            ],
          ),
        )
    ),
  );
}
