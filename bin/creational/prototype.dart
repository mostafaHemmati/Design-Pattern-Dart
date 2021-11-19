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
  late final int _id;
  late final String _name;
  late final String _designation;
  late final double _salary;
  late final String _address;
  EmployeeRecord(
      this._id, this._name, this._designation, this._salary, this._address);

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
