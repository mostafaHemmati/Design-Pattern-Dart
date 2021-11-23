void main(List<String> arguments) {
  var instance1 = SingletonObject.getInstance();
  instance1.showCounter();
  var instance2 = SingletonObject.getInstance();
  instance2.showCounter();
  var instance3 = SingletonObject.getInstance();
  instance3.showCounter();
  // -------------- <Output>-----------
  // 0
  // 1
  // 2
}

class SingletonObject {
  static SingletonObject? _instance;
  var c = 0;

  _SingletonObject() {}

  static SingletonObject getInstance() {
    _instance ??= SingletonObject();
    return _instance!;
  }

  void showCounter() {
    print(c++);
  }
}
