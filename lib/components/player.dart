import 'package:flutgame/my_game.dart';
import 'package:flutter/painting.dart';

class Player {
  final MyGame mygame;
  int maxLives;
  int currentLives;
  Rect playerRect;
  bool isDead = false;
  double speed;
  Player(this.mygame, double x, double y) {
    speed = mygame.tileSize * 2;
    maxLives = currentLives = 3;
    final size = mygame.tileSize * 1.5;

    playerRect = Rect.fromLTWH(x, y, size, size);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t, Offset coords) {
    double stepDistance = -speed * t;
    Offset toPos = mygame.player.playerRect.center - coords;
    Offset stepToPos = Offset.fromDirection(toPos.direction, stepDistance);
    playerRect = playerRect.shift(stepToPos);
  }
}
