void main(List<String> args) {
  Image image = ProxyImage("test.jpg");

  //image will be loaded from disk
  image.display();
  print("---------");

  //image will not be loaded from disk
  image.display();
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
