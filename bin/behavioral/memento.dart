void main(List<String> args) {
  Originator originator = Originator();
  CareTaker careTaker = CareTaker();

  originator.setState("State #1");
  originator.setState("State #2");
  careTaker.add(originator.saveStateToMemento());

  originator.setState("State #3");
  careTaker.add(originator.saveStateToMemento());

  originator.setState("State #4");
  print("Current State: ${originator.getState()}");

  originator.getStateFromMemento(careTaker.get(0));
  print("First saved State: ${originator.getState()}");
  originator.getStateFromMemento(careTaker.get(1));
  print("Second saved State: ${originator.getState()}");
}

class Memento {
  late final String _state;

  Memento(this._state);

  getState() => _state;
}

class Originator {
  String _state = "";
  void setState(String state) {
    _state = state;
  }

  getState() => _state;

  Memento saveStateToMemento() {
    return Memento(_state);
  }

  void getStateFromMemento(Memento memento) {
    _state = memento.getState();
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
