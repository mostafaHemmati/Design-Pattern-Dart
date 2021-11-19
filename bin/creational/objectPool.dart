void main(List<String> args) {
  MyPool pool = MyPool();
  print(pool.toString());
  ObjectClassName p1 = pool.checkout();
  print(pool.toString());
  ObjectClassName p2 = pool.checkout();
  print(pool.toString());
  pool.checkIn(p1);
  print(pool.toString());
}

abstract class ObjectPool<T> {
  var _available = Set<T>();
  var _inUse = Set<T>();

  T create();

  T checkout() {
    if (_available.isEmpty) {
      _available.add(create());
    }
    T instance = _available.last;
    _available.remove(instance);
    _inUse.add(instance);

    return instance;
  }

  void checkIn(T instance) {
    _inUse.remove(instance);
    _available.add(instance);
  }

  @override
  String toString() {
    return "Pool available = ${_available.length}  inUse = ${_inUse.length}";
  }
}

class MyPool extends ObjectPool<ObjectClassName> {
  @override
  ObjectClassName create() {
    return ObjectClassName();
  }
}

class ObjectClassName {
  void sayHello() {
    print("Hello");
  }
}
