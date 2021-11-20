import 'dart:math';

void main(List<String> args) {
  List<String> colors = <String>["Red", "Green", "Blue", "White", "Black"];
  for (int i = 0; i < 20; i++) {
    Circle circle =
        ShapeFactory.getCircle(colors[Random().nextInt(colors.length)])
            as Circle;
    circle.setX(Random().nextInt(100));
    circle.setY(Random().nextInt(100));
    circle.setRadius(100);
    circle.draw();
  }
}

class Shape {
  void draw() {}
}

class Circle implements Shape {
  late final String _color;
  late int _x;
  late int _y;
  late int _radius;
  Circle(this._color);
  void setX(int x) {
    _x = x;
  }

  void setY(int y) {
    _y = y;
  }

  void setRadius(int radius) {
    _radius = radius;
  }

  @override
  void draw() {
    print(
        "Circle: Draw() [Color : $_color, x : $_x, y :$_y, radius : $_radius");
  }
}

class ShapeFactory {
  static final Map<String, Circle> _circleMap = {};

  static Shape getCircle(String color) {
    late Circle circle;
    if (!_circleMap.containsKey(color)) {
      circle = Circle(color);
      _circleMap[color] = circle;
      print("Creating circle of color : $color");
    } else {
      circle = _circleMap[color] as Circle;
    }

    return circle;
  }
}
