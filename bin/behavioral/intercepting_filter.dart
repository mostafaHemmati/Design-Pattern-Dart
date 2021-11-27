void main(List<String> args) {
  FilterManager filterManager = FilterManager(Target());
  filterManager.setFilter(AuthenticationFilter());
  filterManager.setFilter(DebugFilter());

  Client client = Client();
  client.setFilterManager(filterManager);
  client.sendRequest("HOME");

// -------------- <Output>-----------
// Authenticating request: HOME
// request log: HOME
// Executing request: HOME
}

class Filter {
  void execute(String request) {}
}

class AuthenticationFilter implements Filter {
  @override
  void execute(String request) {
    print("Authenticating request: $request");
  }
}

class DebugFilter implements Filter {
  @override
  void execute(String request) {
    print("request log: $request");
  }
}

class Target {
  void execute(String request) {
    print("Executing request: $request");
  }
}

class FilterChain {
  final List<Filter> _filters = <Filter>[];
  late Target _target;
  void addFilter(Filter filter) {
    _filters.add(filter);
  }

  void execute(String request) {
    for (var filter in _filters) {
      filter.execute(request);
    }
    _target.execute(request);
  }

  void setTarget(Target target) {
    _target = target;
  }
}

class FilterManager {
  late FilterChain filterChain;
  FilterManager(Target target) {
    filterChain = FilterChain();
    filterChain.setTarget(target);
  }
  void setFilter(Filter filter) {
    filterChain.addFilter(filter);
  }

  void filterRequest(String request) {
    filterChain.execute(request);
  }
}

class Client {
  late FilterManager filterManager;

  void setFilterManager(FilterManager filterManager) {
    this.filterManager = filterManager;
  }

  void sendRequest(String request) {
    filterManager.filterRequest(request);
  }
}
