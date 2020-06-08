import 'package:flame/flame.dart';
import 'package:flutgame/components/player.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

class MyGame extends Game with TapDetector {
  // Other methods omitted
  Size screenSize;
  double tileSize;
  Player player;
  Offset coords;
  MyGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    coords = Offset(screenSize.width / 2 - tileSize / 2,
        screenSize.height / 2 - tileSize / 2);
    player = Player(this, coords.dx, coords.dy);
  }

  @override
  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);
    player.render(c);
  }

  @override
  void update(double t) {
    player.update(t, coords);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 20;
  }

  @override
  void onTapDown(TapDownDetails details) {
    coords = details.globalPosition;
  }
}
