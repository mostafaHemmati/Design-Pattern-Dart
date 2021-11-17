void main(List<String> arguments) {
  var x = SingletonObject.getInstance();
  x.showCounter();
  var x1 = SingletonObject.getInstance();
  x1.showCounter();
  var x2 = SingletonObject.getInstance();
  x2.showCounter();
}

class SingletonObject {
  static SingletonObject? _instance;
  var c = 0;
  _SingletonObject() {}

  static SingletonObject getInstance() {
    if (_instance == null) {
      _instance = SingletonObject();
    }
    return _instance!;
  }

  void showCounter() {
    print(c++);
  }
}
