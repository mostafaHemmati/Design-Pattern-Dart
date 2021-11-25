void main(List<String> args) {
  Game game = Cricket();
  game.play();
  print("--------------------");
  game = Football();
  game.play();

// -------------- <Output>-----------
// Cricket Game Initialized! Start playing.
// Cricket Game Started. Enjoy the game!
// Cricket Game Finished!
// --------------------
// Football Game Initialized! Start playing.
// Football Game Started. Enjoy the game!
// Football Game Finished!
}

abstract class Game {
  void initialize();
  void startPlay();
  void endPlay();
  void play() {
    initialize();
    startPlay();
    endPlay();
  }
}

class Cricket extends Game {
  @override
  void endPlay() {
    print("Cricket Game Finished!");
  }

  @override
  void initialize() {
    print("Cricket Game Initialized! Start playing.");
  }

  @override
  void startPlay() {
    print("Cricket Game Started. Enjoy the game!");
  }
}

class Football extends Game {
  @override
  void endPlay() {
    print("Football Game Finished!");
  }

  @override
  void initialize() {
    print("Football Game Initialized! Start playing.");
  }

  @override
  void startPlay() {
    print("Football Game Started. Enjoy the game!");
  }
}
