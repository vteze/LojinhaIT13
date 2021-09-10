class Product {
  Product(
    this.name,
    this.image, {
    required this.code,
    required this.description,
    required this.price,
    required this.quantity,
  });

  final int code;
  final String name;
  final String description;
  final String image;
  final int price;
  final int quantity;
}
