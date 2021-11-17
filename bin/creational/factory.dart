void main(List<String> args) {
  var shape1 = ShapeFactory().getShape(ShapeType.Circle);
  shape1!.draw();

  var shape2 = ShapeFactory().getShape(ShapeType.Rectangle);
  shape2!.draw();

  var shape3 = ShapeFactory().getShape(ShapeType.Square);
  shape3!.draw();
}

class Shape {
  void draw() {}
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("Inside Rectangle::draw() method.");
  }
}

class Square implements Shape {
  @override
  void draw() {
    print("Inside Square::draw() method.");
  }
}

class Circle implements Shape {
  @override
  void draw() {
    print("Insid Circle::draw method.");
  }
}

class ShapeFactory {
  Shape? getShape(ShapeType shapeType) {
    if (shapeType == ShapeType.Circle) return Circle();
    if (shapeType == ShapeType.Rectangle) return Rectangle();
    if (shapeType == ShapeType.Square) return Square();
  }
}

enum ShapeType { Circle, Square, Rectangle }
