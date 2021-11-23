void main(List<String> args) {
  Subject subject = Subject();

  HexaObserver(subject);
  OctalObserver(subject);
  BinaryObserver(subject);

  print("First state change: 15");
  subject.state = 15;
  print("Second state change: 10");
  subject.state = 10;

// -------------- <Output>-----------
// First state change: 15
// Hexa String : f
// Octal String :  17
// Binery String :  1111
// Second state change: 10
// Hexa String : a
// Octal String :  12
// Binery String :  1010
}

class Subject {
  final List<Observer> _observers = <Observer>[];
  late int _state;
  int get state => _state;
  set state(int state) {
    _state = state;
    notifyAllObservers();
  }

  void attach(Observer observer) {
    _observers.add(observer);
  }

  void notifyAllObservers() {
    for (var observer in _observers) {
      observer.update();
    }
  }
}

abstract class Observer {
  late Subject _subject;
  void update();
}

class BinaryObserver extends Observer {
  BinaryObserver(Subject subject) {
    _subject = subject;
    _subject.attach(this);
  }
  @override
  void update() {
    print("Binery String :  ${_subject.state.toRadixString(2)}");
  }
}

class OctalObserver extends Observer {
  OctalObserver(Subject subject) {
    _subject = subject;
    _subject.attach(this);
  }
  @override
  void update() {
    print("Octal String :  ${_subject.state.toRadixString(8)}");
  }
}

class HexaObserver extends Observer {
  HexaObserver(Subject subject) {
    _subject = subject;
    _subject.attach(this);
  }
  @override
  void update() {
    print("Hexa String : ${_subject.state.toRadixString(16)}");
  }
}
