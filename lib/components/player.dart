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

    playerRect = Rect.fromLTWH(x, mygame.screenSize.height * 0.8, size, size);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t, Offset coords) {
    double stepDistance = speed * t * 2;
    // Offset toPos = mygame.player.playerRect.center - coords;
    // Offset stepToPos = Offset.fromDirection(toPos.direction, stepDistance);
    // if (stepDistance <= toPos.distance - mygame.tileSize * 1.5) {
    //   playerRect = playerRect.shift(stepToPos);
    // } else {
    //   stepDistance = -stepDistance;
    // }
    double posX = 0;
    double posY = 0;
    if (coords.dx < mygame.screenSize.width / 2) {
      if (playerRect.topLeft.dx > 0) {
        posX = posX - stepDistance;
      }
    } else {
      if (playerRect.topLeft.dx <
          mygame.screenSize.width - playerRect.size.width) {
        posX = posX + stepDistance;
      }
    }
    playerRect = playerRect.translate(posX, posY);
  }
}
