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

// -------------- <Output>-----------
// Creating circle of color : White
// Circle: Draw() [Color : White, x : 0, y :63, radius : 100
// Creating circle of color : Black
// Circle: Draw() [Color : Black, x : 3, y :3, radius : 100
// Creating circle of color : Blue
// Circle: Draw() [Color : Blue, x : 97, y :11, radius : 100
// Circle: Draw() [Color : White, x : 80, y :89, radius : 100
// Circle: Draw() [Color : Blue, x : 85, y :27, radius : 100
// Creating circle of color : Red
// Circle: Draw() [Color : Red, x : 99, y :44, radius : 100
// Circle: Draw() [Color : Red, x : 21, y :32, radius : 100
// Circle: Draw() [Color : White, x : 54, y :74, radius : 100
// Circle: Draw() [Color : White, x : 9, y :34, radius : 100
// Circle: Draw() [Color : Black, x : 26, y :14, radius : 100
// Circle: Draw() [Color : White, x : 70, y :67, radius : 100
// Creating circle of color : Green
// Circle: Draw() [Color : Green, x : 73, y :24, radius : 100
// Circle: Draw() [Color : Blue, x : 78, y :93, radius : 100
// Circle: Draw() [Color : Black, x : 87, y :35, radius : 100
// Circle: Draw() [Color : Red, x : 89, y :7, radius : 100
// Circle: Draw() [Color : White, x : 77, y :70, radius : 100
// Circle: Draw() [Color : White, x : 97, y :72, radius : 100
// Circle: Draw() [Color : Red, x : 37, y :46, radius : 100
// Circle: Draw() [Color : White, x : 77, y :82, radius : 100
// Circle: Draw() [Color : Red, x : 32, y :87, radius : 100
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
