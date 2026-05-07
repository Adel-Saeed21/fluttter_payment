class ItemModel {
  final String name;
  final int amount;
  final String description;
  final int quantity;

  ItemModel({
    required this.name,
    required this.amount,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "amount": amount,
      "description": description,
      "quantity": quantity,
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json["name"],
      amount: json["amount"],
      description: json["description"],
      quantity: json["quantity"],
    );
  }
}