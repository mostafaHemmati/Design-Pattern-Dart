void main(List<String> args) {
  Employee employee =
      EmployeeBuilder().setName("mostafa").setRole("developer").build();
  print("${employee._name}       ${employee._role}");

// -------------- <Output>-----------
// ali       role
}

class Employee {
  late String _name;
  late String _role;

  Employee(EmployeeBuilder builder) {
    _name = builder._name;
    _role = builder._role;
  }
}

class EmployeeBuilder {
  late String _name;
  late String _role;
  EmployeeBuilder setName(String name) {
    _name = name;
    return this;
  }

  EmployeeBuilder setRole(String role) {
    _role = role;
    return this;
  }

  Employee build() {
    return Employee(this);
  }
}
