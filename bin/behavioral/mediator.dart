void main(List<String> args) {
  User robert = User("Robert");
  User john = User("John");

  robert.sendMessage("Hi! John!");
  john.sendMessage("Hello! Robert!");
}

class ChatRoom {
  static void sendMessage(User user, String message) {
    print(" [ ${user.getName()}  ] :  $message");
  }
}

class User {
  late final String _name;

  String getName() => _name;

  User(this._name);
  void sendMessage(String message) {
    ChatRoom.sendMessage(this, message);
  }
}
