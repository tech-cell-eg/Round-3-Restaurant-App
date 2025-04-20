import 'package:food_app/features/restaurant/model/meal.dart';

class Restaurant {
  final double rate;
  final List<Meal> meals;
  final List<String> categories;
  final String id, name, img, desc;
  final int deliveryFees, deliveryTime;

  Restaurant({
    required this.id,
    required this.name,
    required this.img,
    required this.desc,
    required this.rate,
    required this.deliveryFees,
    required this.deliveryTime,
    required this.categories,
    required this.meals,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    img: json["img"],
    desc: json["desc"],
    rate: json["rate"].toDouble(),
    deliveryFees: json["delivery_fees"],
    deliveryTime: json["delivery_time"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
    "desc": desc,
    "rate": rate,
    "delivery_fees": deliveryFees,
    "delivery_time": deliveryTime,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, desc: $desc, rate: $rate, deliveryFees: $deliveryFees, deliveryTime: $deliveryTime, categories: $categories, meals: $meals}';
  }
}
