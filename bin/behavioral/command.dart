void main(List<String> args) {
  Stock abcStock = Stock();

  BuyStock buyStockOrder = BuyStock(abcStock);
  SellStock sellStockOrder = SellStock(abcStock);

  Broker broker = Broker();
  broker.takeOrder(buyStockOrder);
  broker.takeOrder(sellStockOrder);

  broker.placeOrders();
}

class Order {
  void execute() {}
}

class Stock {
  String name = "ABC";
  int quantity = 10;
  void buy() {
    print("stock { name : $name Quantity : $quantity ] bought");
  }

  void sell() {
    print("Stock [ Name: $name  Quantity: $quantity  ] sold");
  }
}

class BuyStock implements Order {
  late final Stock _abcStock;
  BuyStock(this._abcStock);

  @override
  void execute() {
    _abcStock.buy();
  }
}

class SellStock implements Order {
  late final Stock _abcStock;
  SellStock(this._abcStock);

  @override
  void execute() {
    _abcStock.sell();
  }
}

class Broker {
  final List<Order> _orderList = <Order>[];
  void takeOrder(Order order) {
    _orderList.add(order);
  }

  void placeOrders() {
    for (var order in _orderList) {
      order.execute();
    }
    _orderList.clear();
  }
}
