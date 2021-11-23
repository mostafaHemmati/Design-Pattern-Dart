void main(List<String> args) {
  Shape redCircle = Circle(100, 100, 10, RedCircle());
  Shape greenCircle = Circle(100, 100, 10, GreenCircle());

  redCircle.draw();
  greenCircle.draw();
  // -------------- <Output>-----------
// Drawing Circle[ color: red, radius: 10, x:  100 , y: 100 ]
// Drawing Circle[ color: green, radius:  10, x:  100 , y: 100 ]
}

class DrawAPI {
  void drawCircle(int radius, int x, int y) {}
}

class RedCircle implements DrawAPI {
  @override
  void drawCircle(int radius, int x, int y) {
    print("Drawing Circle[ color: red, radius: $radius, x:  $x , y: $y ]");
  }
}

class GreenCircle implements DrawAPI {
  @override
  void drawCircle(int radius, int x, int y) {
    print("Drawing Circle[ color: green, radius:  $radius, x:  $x , y: $y ]");
  }
}

abstract class Shape {
  late DrawAPI drawAPI;

  Shape(this.drawAPI);

  void draw();
}

class Circle extends Shape {
  int x, y, radius;

  Circle(this.x, this.y, this.radius, drawAPI) : super(drawAPI);

  @override
  void draw() {
    drawAPI.drawCircle(radius, x, y);
  }
}
