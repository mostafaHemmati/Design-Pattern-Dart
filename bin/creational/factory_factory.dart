void main(List<String> args) {
  var shapeFactory = FactoryProducer.getFactory(false);
  var rectangle = shapeFactory.getShape(ShapeType.rectangle);
  rectangle!.draw();
  var square = shapeFactory.getShape(ShapeType.square);
  square!.draw();

  var roundedShape = FactoryProducer.getFactory(true);
  var roundedRectangle = roundedShape.getShape(ShapeType.roundedRectangle);
  roundedRectangle!.draw();
  var roundedSquare = roundedShape.getShape(ShapeType.roundedSquare);
  roundedSquare!.draw();
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

class RounndedRectangle implements Shape {
  @override
  void draw() {
    print("Inside Rounded Rectangle::draw() method.");
  }
}

class RoundedSquare implements Shape {
  @override
  void draw() {
    print("Inside Rounded Square::draw() method.");
  }
}

abstract class AbstractFactory {
  Shape? getShape(ShapeType shapeType);
}

class ShapeFactory extends AbstractFactory {
  @override
  Shape? getShape(ShapeType shapeType) {
    if (shapeType == ShapeType.rectangle) return Rectangle();
    if (shapeType == ShapeType.square) return Square();
  }
}

class RoundedShapeFactory extends AbstractFactory {
  @override
  Shape? getShape(ShapeType shapeType) {
    if (shapeType == ShapeType.roundedRectangle) return RounndedRectangle();
    if (shapeType == ShapeType.roundedSquare) return RoundedSquare();
  }
}

enum ShapeType { square, rectangle, roundedRectangle, roundedSquare }

class FactoryProducer {
  static AbstractFactory getFactory(bool rounded) {
    if (rounded) {
      return RoundedShapeFactory();
    } else {
      return ShapeFactory();
    }
  }
}
