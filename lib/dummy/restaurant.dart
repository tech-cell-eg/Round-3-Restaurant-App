import 'package:food_app/features/restaurant/model/meal.dart';
import 'package:food_app/features/restaurant/model/restaurant.dart';

final List<Restaurant> restaurants = [
  Restaurant(
    id: "1",
    name: "Burger King",
    desc:
        "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae.",
    img:
        "https://th.bing.com/th/id/OIP.ZjHy90oXmNzr7D7ZR9NIXQHaHa?rs=1&pid=ImgDetMain",
    rate: 4.7,
    deliveryFees: 0,
    deliveryTime: 15,
    categories: ["burger", "pizza", "pasta"],
    meals: meals,
  ),
];

final List<Meal> meals = [
  Meal(
    id: "1",
    time: 15,
    rate: 4.7,
    name: "Pizza 1",
    category: "pizza",
    ingredients: ["chicken", "onion", "cheese"],
    img:
        "https://th.bing.com/th/id/OIP.SEfXqwWqK1NNMpH9ZmNrgwHaE8?rs=1&pid=ImgDetMain",
    desc:
        "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae.",
    sizes: [
      MealSize(id: "8", size: "8", price: 30),
      MealSize(id: "10", size: "10", price: 42),
      MealSize(id: "14", size: "14", price: 58),
      MealSize(id: "18", size: "18", price: 82),
    ],
  ),
  Meal(
    id: "2",
    time: 15,
    rate: 4.7,
    name: "Burger 1",
    category: "burger",
    ingredients: ["chicken", "onion", "cheese"],
    img:
        "https://th.bing.com/th/id/OIP.KomAB7rg-OCyK3QEDO81fwHaEn?rs=1&pid=ImgDetMain",
    desc:
        "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae.",
    sizes: [
      MealSize(id: "small", size: "Small", price: 8),
      MealSize(id: "medium", size: "Medium", price: 12),
      MealSize(id: "large", size: "Large", price: 24),
      MealSize(id: "family", size: "Family", price: 35),
    ],
  ),
  Meal(
    id: "3",
    time: 15,
    rate: 4.7,
    name: "Pasta 1",
    category: "pasta",
    ingredients: ["chicken", "onion", "cheese"],
    img:
        "https://hips.hearstapps.com/hmg-prod/images/creamy-pasta-burrata-7-1656098638.jpeg",
    desc:
        "lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quae.",
    sizes: [
      MealSize(id: "small", size: "Small", price: 14),
      MealSize(id: "medium", size: "Medium", price: 28),
      MealSize(id: "large", size: "Large", price: 43),
      MealSize(id: "family", size: "Family", price: 75),
    ],
  ),
];

