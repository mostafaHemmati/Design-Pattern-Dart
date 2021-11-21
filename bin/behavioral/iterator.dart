void main(List<String> args) {
  NameRepository namesRepository = NameRepository();

  for (Iterator iter = namesRepository.getIterator()!; iter.hasNext()!;) {
    String name = iter.next() as String;
    print("Name : $name");
  }
}

class Iterator {
  bool? hasNext() {}
  Object? next() {}
}

class Container {
  Iterator? getIterator() {}
}

class NameRepository implements Container {
  List<String> names = <String>["Robert", "John", "Julie", "Lora"];

  @override
  Iterator? getIterator() {
    return NameIterator(names);
  }
}

class NameIterator implements Iterator {
  int index = 0;
  final List<String> _names;
  NameIterator(this._names);
  @override
  bool? hasNext() {
    if (index < _names.length) return true;
    return false;
  }

  @override
  Object? next() {
    if (hasNext()!) return _names[index++];
    return null;
  }
}
