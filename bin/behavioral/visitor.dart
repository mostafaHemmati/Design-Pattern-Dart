void main(List<String> args) {
  ComputerPart computer = Computer();
  computer.accept(ComputerPartDisplayVisitor());

// -------------- <Output>-----------
// Displaying Mouse.
// Displaying Keyboard.
// Displaying Monitor.
// Displaying Computer.
}

class ComputerPart {
  void accept(ComputerPartVisitor computerPartVisitor) {}
}

class Keyboard implements ComputerPart {
  @override
  void accept(computerPartVisitor) {
    computerPartVisitor.visit(this);
  }
}

class Monitor implements ComputerPart {
  @override
  void accept(computerPartVisitor) {
    computerPartVisitor.visit(this);
  }
}

class Mouse implements ComputerPart {
  @override
  void accept(computerPartVisitor) {
    computerPartVisitor.visit(this);
  }
}

class Computer implements ComputerPart {
  late List<ComputerPart> parts;
  Computer() {
    parts = [Mouse(), Keyboard(), Monitor()];
  }
  @override
  void accept(computerPartVisitor) {
    for (var part in parts) {
      part.accept(computerPartVisitor);
    }
    computerPartVisitor.visit(this);
  }
}

class ComputerPartVisitor {
  void visit(ComputerPart part) {}
}

class ComputerPartDisplayVisitor implements ComputerPartVisitor {
  @override
  void visit(ComputerPart part) {
    if (part is Monitor) {
      print("Displaying Monitor.");
    } else if (part is Mouse) {
      print("Displaying Mouse.");
    } else if (part is Keyboard) {
      print("Displaying Keyboard.");
    } else if (part is Computer) {
      print("Displaying Computer.");
    }
  }
}
