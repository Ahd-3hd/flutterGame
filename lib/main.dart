import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flutgame/my_game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeRight);
  Game mygame = MyGame();

  runApp(mygame.widget);
}
