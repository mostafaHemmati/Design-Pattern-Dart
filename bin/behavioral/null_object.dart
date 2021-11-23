void main(List<String> args) {
  AbstractCustomer customer1 = CustomerFactory.getCustomer("Rob");
  AbstractCustomer customer2 = CustomerFactory.getCustomer("Bob");
  AbstractCustomer customer3 = CustomerFactory.getCustomer("Julie");
  AbstractCustomer customer4 = CustomerFactory.getCustomer("Laura");

  print("Customers");
  print(customer1.getName());
  print(customer2.getName());
  print(customer3.getName());
  print(customer4.getName());

// -------------- <Output>-----------
// Customers
// Rob
// Not Available in Customer Database
// Julie
// Not Available in Customer Database
}

abstract class AbstractCustomer {
  late String name;
  bool isNull();
  String getName();
}

class RealCustomer extends AbstractCustomer {
  RealCustomer(_name) {
    name = _name;
  }
  @override
  String getName() {
    return name;
  }

  @override
  bool isNull() {
    return false;
  }
}

class NullCustomer extends AbstractCustomer {
  @override
  String getName() {
    return "Not Available in Customer Database";
  }

  @override
  bool isNull() {
    return true;
  }
}

class CustomerFactory {
  static final List<String> names = <String>["Rob", "Joe", "Julie"];
  static AbstractCustomer getCustomer(String name) {
    for (int i = 0; i < names.length; i++) {
      if (names[i].toLowerCase() == name.toLowerCase()) {
        return RealCustomer(name);
      }
    }
    return NullCustomer();
  }
}
