class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imgPath;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imgPath});
  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        description: json['description'] ?? "",
        price: json['price'] ?? 0,
        imgPath: json['imgPath'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imgPath': imgPath,
    };
  }
}
