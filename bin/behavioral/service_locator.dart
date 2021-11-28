void main(List<String> args) {
  Service? service = ServiceLocator.getService("SERVICE1");
  service!.execute();
  service = ServiceLocator.getService("SERVICE2");
  service!.execute();
  service = ServiceLocator.getService("SERVICE1");
  service!.execute();
  service = ServiceLocator.getService("SERVICE2");
  service!.execute();

// -------------- <Output>-----------
// Looking up and creating a new Service1 object
// Executing Service1
// Looking up and creating a new Service2 object
// Executing Service2
// Returning cached  Service1 object
// Executing Service1
// Returning cached  Service2 object
// Executing Service2
}

class Service {
  String? getName() {}
  void execute() {}
}

class Service1 implements Service {
  @override
  void execute() {
    print("Executing Service1");
  }

  @override
  String? getName() {
    return "Service1";
  }
}

class Service2 implements Service {
  @override
  void execute() {
    print("Executing Service2");
  }

  @override
  String? getName() {
    return "Service2";
  }
}

class InitialContext {
  Object lookup(String jndiName) {
    if (jndiName == "SERVICE1") {
      print("Looking up and creating a new Service1 object");
      return Service1();
    } else {
      print("Looking up and creating a new Service2 object");
      return Service2();
    }
  }
}

class Cache {
  late List<Service> _services;
  Cache() {
    _services = <Service>[];
  }
  Service? getService(String serviceName) {
    for (var service in _services) {
      if (service.getName() == serviceName) {
        print("Returning cached  $serviceName  object");
        return service;
      }
    }
    return null;
  }

  void addService(Service newService) {
    bool exists = false;
    for (var service in _services) {
      if (service.getName() == newService.getName()) {
        exists = true;
      }
    }
    if (!exists) {
      _services.add(newService);
    }
  }
}

class ServiceLocator {
  static Cache _cache = Cache();
  static Service? getService(String jndiName) {
    Service? service = _cache.getService(jndiName);

    if (service != null) {
      return service;
    }

    InitialContext context = new InitialContext();
    Service? service1 = context.lookup(jndiName) as Service;
    _cache.addService(service1);
    return service1;
  }
}
