class RestaurantModel {
  final int id;
  final String name;
  final String imageUrl;
  final String des;
  final int rating;
  final double deliveryFees;
  final int deliveryTime;

  RestaurantModel({
    required this.deliveryFees,
    required this.deliveryTime,
    required this.des,
    required this.rating,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['img'],
      des: json['desc'],
      rating: json['rate'],
      deliveryFees: json["deliveryFees"],
      deliveryTime: json["deliveryTime"],
    );
  }
}
