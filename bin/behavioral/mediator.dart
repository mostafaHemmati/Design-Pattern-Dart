void main(List<String> args) {
  User robert = User("Robert");
  User john = User("John");

  robert.sendMessage("Hi! John!");
  john.sendMessage("Hello! Robert!");

// -------------- <Output>-----------
//  [ Robert  ] :  Hi! John!
//  [ John  ] :  Hello! Robert!
}

class ChatRoom {
  static void sendMessage(User user, String message) {
    print(" [ ${user.name}  ] :  $message");
  }
}

class User {
  late final String _name;

  String get name => _name;

  User(this._name);
  void sendMessage(String message) {
    ChatRoom.sendMessage(this, message);
  }
}
