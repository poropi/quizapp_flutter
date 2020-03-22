import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundUtils {
  static final Soundpool _pool = Soundpool(streamType: StreamType.notification);
  static int _pushSound = 0;

  static initSound() async {
    _pushSound = await rootBundle.load("assets/voice/decision7.mp3").then((ByteData soundData) {
      return _pool.load(soundData);
    });
  }

  static doPushSound() async {
    int streamId = await _pool.play(_pushSound);
  }

}