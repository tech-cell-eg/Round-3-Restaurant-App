class Meal {
  final int price;
  final double rate;
  final String id, name, desc, img, category;
  final List<String> sizes, ingredients;

  Meal({
    required this.id,
    required this.img,
    required this.rate,
    required this.name,
    required this.desc,
    required this.price,
    required this.sizes,
    required this.category,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json["id"],
      img: json["img"],
      name: json["name"],
      desc: json["desc"],
      sizes: json["sizes"],
      price: json["price"],
      category: json["category"],
      rate: json["rate"] as double,
      ingredients: json["ingredients"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "rate": rate,
    "name": name,
    "desc": desc,
    "sizes": sizes,
    "price": price,
    "category": category,
    "ingredients": ingredients,
  };

  @override
  String toString() {
    return 'Meal{id: $id, name: $name, desc: $desc, rate: $rate, sizes: $sizes, ingredients: $ingredients}';
  }
}
