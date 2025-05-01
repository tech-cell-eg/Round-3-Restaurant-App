class FoodMealsModel {
  final int id;
  final String name;
  final String image;
  final String category;
  final double price;

  FoodMealsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });

  factory FoodMealsModel.fromJson(Map<String, dynamic> json) {
    // التحقق من أن sizes هي قائمة وليست فارغة
    final sizes = json['sizes'] as List<dynamic>?;
    final price = sizes != null && sizes.isNotEmpty
        ? (sizes[0]['price'] as num?)?.toDouble() ?? 0.0
        : 0.0;

    return FoodMealsModel(
      id: json['id'] as int? ?? 0, // قيمة افتراضية إذا كان null
      name: json['name'] as String? ?? 'Unknown', // قيمة افتراضية
      image: json['img'] as String? ?? '', // قيمة افتراضية
      category: json['category'] as String? ?? 'Unknown', // قيمة افتراضية
      price: price,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'img': image,
        'category': category,
        'price': price,
      };
}