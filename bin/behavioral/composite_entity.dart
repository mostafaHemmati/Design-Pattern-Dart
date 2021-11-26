void main(List<String> args) {
  Client client = Client();
  client.setData("Test", "Data");
  client.printData();
  client.setData("Second Test", "Data1");
  client.printData();
// -------------- <Output>-----------

// data : Test
// data : Data
// data : Second Test
// data : Data1
}

class DependentObject1 {
  late String _data;

  String get data => _data;

  set data(String data) {
    _data = data;
  }
}

class DependentObject2 {
  late String _data;

  String get data => _data;

  set data(String data) {
    _data = data;
  }
}

class CoarseGrainedObject {
  DependentObject1 do1 = DependentObject1();
  DependentObject2 do2 = DependentObject2();
  void setData(String data1, String data2) {
    do1.data = data1;
    do2.data = data2;
  }

  List<String> get data => <String>[do1.data, do2.data];
}

class CompositeEntity {
  CoarseGrainedObject _cgo = CoarseGrainedObject();

  void setData(String data1, String data2) {
    _cgo.setData(data1, data2);
  }

  List<String> get data => _cgo.data;
}

class Client {
  CompositeEntity _compositeEntity = CompositeEntity();
  void printData() {
    for (var item in _compositeEntity.data) {
      print("data : $item");
    }
  }

  void setData(String data1, String data2) {
    _compositeEntity.setData(data1, data2);
  }
}
