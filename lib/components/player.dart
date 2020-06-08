import 'dart:ui';

import 'package:flutgame/game_controller.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;
  double posX;
  double posY;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    posX = gameController.screenSize.width / 2 - size / 2;
    posY = gameController.screenSize.height / 2 - size / 2;
    playerRect = Rect.fromLTWH(posX, posY, size, size);
  }

  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t) {
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      gameController.initialize();
    }
  }
}
