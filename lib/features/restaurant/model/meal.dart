class Meal {
  final int time;
  final double rate;
  final List<MealSize> sizes;
  final List<String> ingredients;
  final String id, name, desc, img, category;

  Meal({
    required this.id,
    required this.img,
    required this.rate,
    required this.name,
    required this.time,
    required this.desc,
    required this.sizes,
    required this.category,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json["id"],
      img: json["img"],
      name: json["name"],
      time: json["time"],
      desc: json["desc"],
      category: json["category"],
      rate: json["rate"] as double,
      ingredients: json["ingredients"],
      sizes: List<MealSize>.from(
        json["sizes"].map((x) => MealSize.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "rate": rate,
    "name": name,
    "time": time,
    "desc": desc,
    "category": category,
    "ingredients": ingredients,
    "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Meal{id: $id, name: $name, desc: $desc, rate: $rate, sizes: $sizes, ingredients: $ingredients}';
  }
}

class MealSize {
  final String id, size;
  final double price;

  MealSize({required this.id, required this.size, required this.price});

  factory MealSize.fromJson(Map<String, dynamic> json) {
    return MealSize(id: json["id"], size: json["size"], price: json["price"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "size": size, "price": price};
}
