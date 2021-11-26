void main(List<String> args) {
  FrontController frontController = FrontController();
  frontController.dispatchRequest("HOME");
  frontController.dispatchRequest("STUDENT");

// -------------- <Output>-----------
// Page requested:  HOME
// User is authenticated successfully.
// Displaying Home Page
// Page requested:  STUDENT
// User is authenticated successfully.
// Displaying Student Page
}

class HomeView {
  void show() {
    print("Displaying Home Page");
  }
}

class StudentView {
  void show() {
    print("Displaying Student Page");
  }
}

class Dispatcher {
  late StudentView _studentView;
  late HomeView _homeView;
  Dispatcher() {
    _studentView = StudentView();
    _homeView = HomeView();
  }

  void dispatch(String request) {
    if (request == "STUDENT") {
      _studentView.show();
    } else {
      _homeView.show();
    }
  }
}

class FrontController {
  late Dispatcher _dispatcher;
  FrontController() {
    _dispatcher = Dispatcher();
  }
  bool isAuthenticUser() {
    print("User is authenticated successfully.");
    return true;
  }

  void trackRequest(String request) {
    print("Page requested:  $request ");
  }

  void dispatchRequest(String request) {
    trackRequest(request);

    if (isAuthenticUser()) {
      _dispatcher.dispatch(request);
    }
  }
}
