void main(List<String> args) {
  ShapeMaker shapeMaker = ShapeMaker();

  shapeMaker.drawCircle();
  shapeMaker.drawRectangle();

// -------------- <Output>-----------
// Circle::draw()
// Rectangle::draw()
}

class Shape {
  void draw() {}
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("Rectangle::draw()");
  }
}

class Circle implements Shape {
  @override
  void draw() {
    print("Circle::draw()");
  }
}

class ShapeMaker {
  late Shape circle;
  late Shape rectangle;
  ShapeMaker() {
    circle = Circle();
    rectangle = Rectangle();
  }
  void drawCircle() {
    circle.draw();
  }

  void drawRectangle() {
    rectangle.draw();
  }
}
