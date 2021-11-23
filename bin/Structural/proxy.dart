void main(List<String> args) {
  Image image = ProxyImage("test.jpg");

  print("image will be loaded from disk");
  image.display();
  print("-----------------");

  print("image will not be loaded from disk");
  image.display();

// -------------- <Output>-----------
// image will be loaded from disk
// Loading test.jpg
// Displaying  test.jpg
// -----------------
// image will not be loaded from disk
// Displaying  test.jpg
}

class Image {
  void display() {}
}

class RealImage implements Image {
  late String _fileName;

  RealImage(String fileName) {
    _fileName = fileName;
    loadFromDisk(fileName);
  }

  void loadFromDisk(String fileName) {
    print("Loading $fileName");
  }

  @override
  void display() {
    print("Displaying  $_fileName");
  }
}

class ProxyImage implements Image {
  RealImage? _realImage;
  late final String _fileName;
  ProxyImage(this._fileName);

  @override
  void display() {
    _realImage ??= RealImage(_fileName);
    _realImage!.display();
  }
}
