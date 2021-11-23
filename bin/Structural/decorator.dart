void main(List<String> args) {
  Shape circle = Circle();
  circle.draw();

  Shape redCircle = RedShapeDecorator(Circle());
  redCircle.draw();

  Shape redRectangle = RedShapeDecorator(Rectangle());
  redRectangle.draw();

// -------------- <Output>-----------

// Shape: Circle
// Border Color: Red
// Shape: Rectangle
// Border Color: Red
}

class Shape {
  void draw() {}
}

class Circle implements Shape {
  @override
  void draw() {
    print("Shape: Circle");
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("Shape: Rectangle");
  }
}

abstract class ShapeDecorator implements Shape {
  late Shape decoratedShape;
  ShapeDecorator(this.decoratedShape);
  void draw() {
    decoratedShape.draw();
  }
}

class RedShapeDecorator extends ShapeDecorator {
  RedShapeDecorator(Shape decoratedShape) : super(decoratedShape);

  @override
  void draw() {
    decoratedShape.draw();
    setRedBorder(decoratedShape);
  }
}

void setRedBorder(Shape decoratedShape) {
  print("Border Color: Red");
}
