void main() {
  final cart = Box(List.generate(
      2,
      (index) => index.isEven
          ? Box(getBox(index + 1))
          : Product(200, '$index 200')));
  print(cart.getPrice());
  print(cart.childrens.toString());
}

List<Component> getBox(int len) => List<Component>.generate(
    len,
    (index) => index.isEven
        ? Product(100, '$index 100')
        : Box(getBox(len - 1)));

abstract class Component {
  int getPrice();
}

class Product implements Component {
  final int price;
  final String name;

  Product(this.price, this.name);
  @override
  int getPrice() {
    return price;
  }
}

class Box implements Component {
  final List<Component> childrens;

  Box(this.childrens);

  @override
  int getPrice() {
    var sum = 0;
    for (var item in childrens) {
      sum += item.getPrice();
    }
    return sum;
  }
}
