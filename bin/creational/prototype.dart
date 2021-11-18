void main(List<String> args) {
  var e1 = EmployeeRecord(1, "mostafa hemmati", "developer", 1000, "hamedan");
  e1.showRecord();
  EmployeeRecord e2 = e1.getClone() as EmployeeRecord;
  e2.showRecord();
}

abstract class Prototype {
  Prototype getClone();
}

class EmployeeRecord implements Prototype {
  late int _id;
  late String _name;
  late String _designation;
  late double _salary;
  late String _address;
  EmployeeRecord(
      int id, String name, String designation, double salary, String address) {
    _id = id;
    _name = name;
    _designation = designation;
    _salary = salary;
    _address = address;
  }
  void showRecord() {
    print("name : $_name");
    print("designation : $_designation");
    print("id : $_id");
  }

  @override
  Prototype getClone() {
    return EmployeeRecord(_id, _name, _designation, _salary, _address);
  }
}
