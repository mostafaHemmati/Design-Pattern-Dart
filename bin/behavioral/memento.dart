void main(List<String> args) {
  Originator originator = Originator();
  CareTaker careTaker = CareTaker();

  originator.state = "State #1";
  originator.state = "State #2";
  careTaker.add(originator.saveStateToMemento());

  originator.state = "State #3";
  careTaker.add(originator.saveStateToMemento());

  originator.state = "State #4";
  print("Current State: ${originator.state}");

  originator.getStateFromMemento(careTaker.get(0));
  print("First saved State: ${originator.state}");
  originator.getStateFromMemento(careTaker.get(1));
  print("Second saved State: ${originator.state}");

// -------------- <Output>-----------
// Current State: State #4
// First saved State: State #2
// Second saved State: State #3
}

class Memento {
  final String _state;

  String get state => _state;

  Memento(this._state);
}

class Originator {
  late String _state;

  String get state => _state;

  set state(String state) {
    _state = state;
  }

  Memento saveStateToMemento() {
    return Memento(_state);
  }

  void getStateFromMemento(Memento memento) {
    _state = memento.state;
  }
}

class CareTaker {
  List<Memento> mementoList = <Memento>[];

  void add(Memento state) {
    mementoList.add(state);
  }

  Memento get(int index) {
    return mementoList[index];
  }
}
