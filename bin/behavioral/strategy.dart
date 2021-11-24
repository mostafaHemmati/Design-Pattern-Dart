void main(List<String> args) {
  Context context = Context(OperationAdd());
  print("10 + 5 = ${context.executeStrategy(10, 5)}");

  context = Context(OperationSubstract());
  print("10 - 5 = ${context.executeStrategy(10, 5)}");

  context = Context(OperationMultiply());
  print("10 * 5 = ${context.executeStrategy(10, 5)}");

// -------------- <Output>-----------
// 10 + 5 = 15
// 10 - 5 = 5
// 10 * 5 = 50
}

class Strategy {
  int? doOperation(int num1, int num2) {}
}

class OperationAdd implements Strategy {
  @override
  int? doOperation(int num1, int num2) => num1 + num2;
}

class OperationSubstract implements Strategy {
  @override
  int? doOperation(int num1, int num2) => num1 - num2;
}

class OperationMultiply implements Strategy {
  @override
  int? doOperation(int num1, int num2) => num1 * num2;
}

class Context {
  late final Strategy _strategy;
  Context(this._strategy);
  int? executeStrategy(num1, num2) => _strategy.doOperation(num1, num2);
}
