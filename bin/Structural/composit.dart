void main(List<String> args) {
  Company engDirectory = Company("engDirectory");
  Developer dev1 = Developer(100, "Mostafa hemati", "Pro Developer");
  Developer dev2 = Developer(101, "hassan  kamrani", "Developer");
  engDirectory.addEmployee(dev1);
  engDirectory.addEmployee(dev2);

  Manager man1 = Manager(200, "mahdi zareei", "Sr Manager");
  Manager man2 = Manager(201, "ramin Jafari", "Manager");
  Company accDirectory = Company("accDirectory");
  accDirectory.addEmployee(man1);
  accDirectory.addEmployee(man2);

  Company directory = Company("directory");
  directory.addEmployee(engDirectory);
  directory.addEmployee(accDirectory);
  directory.showEmployeeDetails();

// -------------- <Output>-----------
// Company  directory  detail :
// Company  engDirectory  detail :
// name : Mostafa hemati  Id : 100  position : Pro Developer
// name : hassan  kamrani  Id : 101  position : Developer
// Company  accDirectory  detail :
// name : mahdi zareei  Id : 200  position : Sr Manager
// name : ramin Jafari  Id : 201  position : Manager
}

class Employee {
  void showEmployeeDetails() {}
}

class Developer implements Employee {
  late final String _name;
  late final int _emId;
  late final String _position;
  Developer(this._emId, this._name, this._position);
  @override
  void showEmployeeDetails() {
    print("name : $_name  Id : $_emId  position : $_position");
  }
}

class Manager implements Employee {
  late final String _name;
  late final int _emId;
  late final String _position;
  Manager(this._emId, this._name, this._position);
  @override
  void showEmployeeDetails() {
    print("name : $_name  Id : $_emId  position : $_position");
  }
}

class Company implements Employee {
  final List<Employee> _employeeList = <Employee>[];
  late final String _name;
  Company(this._name);

  @override
  void showEmployeeDetails() {
    print("Company  $_name  detail :");
    for (Employee e in _employeeList) {
      e.showEmployeeDetails();
    }
  }

  void addEmployee(Employee e) {
    _employeeList.add(e);
  }

  void removeEmployee(Employee e) {
    _employeeList.remove(e);
  }
}
