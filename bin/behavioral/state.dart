void main(List<String> args) {
  Context context = Context();

  StartState startState = StartState();
  startState.doAction(context);

  print(context.state.toString());

  StopState stopState = StopState();
  stopState.doAction(context);

  print(context.state.toString());
// -------------- <Output>-----------
// Player is in start state
// Stert State
// Player is in stop state
// Stop State
}

class State {
  void doAction(Context context) {}
}

class StartState implements State {
  @override
  void doAction(context) {
    print("Player is in start state");
    context.state = this;
  }

  @override
  String toString() {
    return "Stert State";
  }
}

class StopState implements State {
  @override
  void doAction(context) {
    print("Player is in stop state");
    context.state = this;
  }

  @override
  String toString() {
    return "Stop State";
  }
}

class Context {
  late State _state;

  State get state => _state;

  set state(State state) {
    _state = state;
  }
}
