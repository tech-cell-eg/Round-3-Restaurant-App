enum OrderStatus { ongoing, completed, canceled }

class Order {
  final String image;
  final String id;
  final String restaurant;
  final double price;
  final int items;
  final String category;
  final OrderStatus status;
  final DateTime date;

  Order({
    required this.image,
    required this.id,
    required this.restaurant,
    required this.price,
    required this.items,
    required this.category,
    required this.status,
    required this.date,
  });
}
