import 'dart:io';

import 'player.dart';

class Game {
  late Player player1;
  late Player player2;

  void start() {
    print("Добро пожаловать в Морской бой!");
    print("Игрок 1, введите своё имя:");
    String name1 = stdin.readLineSync()!;
    player1 = Player(name1);

    print("Игрок 2, введите своё имя:");
    String name2 = stdin.readLineSync()!;
    player2 = Player(name2);

    print("Игрок 1 расставляет корабли.");
    player1.board.placeShips();
    print("Игрок 2 расставляет корабли.");
    player2.board.placeShips();

    play();
  }

  void play() {
    Player current = player1;
    Player opponent = player2;

    while (true) {
      print("\nХодит ${current.name}");
      current.makeMove(opponent.board);

      if (opponent.board.isAllShipsSunk()) {
        print("Поздравляем, ${current.name}! Вы победили!");
        break;
      }

      Player temp = current;
      current = opponent;
      opponent = temp;
    }
  }
}
