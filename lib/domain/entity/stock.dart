class Stock {
  int? id;
  String name;
  int quantity = 0;

  Stock(this.id, this.name, this.quantity);

  updateStock(int quantity) {
    if (quantity >= 0) {
      this.quantity = quantity;
    } else {
      throw Exception("Quantidade menor que 0");
    }
  }
}
