void main(List<String> args) {
  BusinessDelegate businessDelegate = BusinessDelegate();
  businessDelegate._serviceType = "EJB";

  Client client = Client(businessDelegate);
  client.doTask();

  businessDelegate._serviceType = "JMS";
  client.doTask();

// -------------- <Output>-----------
// Processing task by invoking EJB Service
// Processing task by invoking JMS Service
}

class BusinessService {
  void doProcessing() {}
}

class EJBService implements BusinessService {
  @override
  void doProcessing() {
    print("Processing task by invoking EJB Service");
  }
}

class JMSService implements BusinessService {
  @override
  void doProcessing() {
    print("Processing task by invoking JMS Service");
  }
}

class BusinessLookUp {
  BusinessService getBusinessService(String serviceType) {
    if (serviceType == "EJB") {
      return EJBService();
    } else {
      return JMSService();
    }
  }
}

class BusinessDelegate {
  final BusinessLookUp _businessLookUp = BusinessLookUp();
  late BusinessService _businessService;
  late String _serviceType;

  set serviceType(String serviceType) {
    _serviceType = serviceType;
  }

  void doTask() {
    _businessService = _businessLookUp.getBusinessService(_serviceType);
    _businessService.doProcessing();
  }
}

class Client {
  late final BusinessDelegate _businessService;
  Client(this._businessService);
  void doTask() {
    _businessService.doTask();
  }
}
