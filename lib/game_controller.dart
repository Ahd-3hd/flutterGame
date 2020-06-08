import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Size screenSize;
  double tileSize;
  GameController(this.storage) {
    initialize();
  }
  void initialize() async {
    resize(await Flame.util.initialDimensions());
  }

  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);
  }

  void update(double t) {}

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }
}
