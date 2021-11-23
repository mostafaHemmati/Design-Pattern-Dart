void main(List<String> args) {
  Expression isMale = getMaleExpression();
  Expression isMarriedWoman = getMarriedWomanExpression();

  print("John is male?  ${isMale.interpreter("John")}");
  print(
      "Julie is a married women?  ${isMarriedWoman.interpreter("Married Julie")}");

  // -------------- <Output>-----------
// John is male?  true
// Julie is a married women?  true
}

class Expression {
  bool? interpreter(String context) {}
}

class TerminalExpression implements Expression {
  late final String _data;
  TerminalExpression(this._data);

  @override
  bool? interpreter(String context) {
    if (context.contains(_data)) {
      return true;
    }
    return false;
  }
}

class OrExpression implements Expression {
  late final Expression _expr1;
  late final Expression _expr2;

  OrExpression(this._expr1, this._expr2);

  @override
  bool? interpreter(String context) {
    return (_expr1.interpreter(context)! || _expr2.interpreter(context)!);
  }
}

class AndExpression implements Expression {
  late final Expression _expr1;
  late final Expression _expr2;

  AndExpression(this._expr1, this._expr2);

  @override
  bool? interpreter(String context) {
    return (_expr1.interpreter(context)! && _expr2.interpreter(context)!);
  }
}

Expression getMaleExpression() {
  Expression robert = TerminalExpression("Robert");
  Expression john = TerminalExpression("John");
  return OrExpression(robert, john);
}

Expression getMarriedWomanExpression() {
  Expression julie = TerminalExpression("Julie");
  Expression married = TerminalExpression("Married");
  return AndExpression(julie, married);
}
