class Functions {
  static String getChatID(String userId, String restaurantId) {
    if (userId.compareTo(restaurantId) > 0) {
      return '$userId-$restaurantId';
    } else {
      return '$restaurantId-$userId';
    }
  }
}
