import 'package:week8/data.dart';

class ItemFood {
  final Food food;
  bool isVisible;

  ItemFood({required this.food, this.isVisible = false});
}

class DataItem {
  static List<ItemFood> itemSashimi = FoodData.listFoods
      .where((element) => element.typeId == 0)
      .map((e) => ItemFood(food: e))
      .toList();
  static List<ItemFood> itemSushi = FoodData.listFoods
      .where((element) => element.typeId == 1)
      .map((e) => ItemFood(food: e))
      .toList();
  static List<ItemFood> itemMaki = FoodData.listFoods
      .where((element) => element.typeId == 2)
      .map((e) => ItemFood(food: e))
      .toList();
  static List<ItemFood> itemCombo = FoodData.listFoods
      .where((element) => element.typeId == 3)
      .map((e) => ItemFood(food: e))
      .toList();
  static List<ItemFood> itemSalat = FoodData.listFoods
      .where((element) => element.typeId == 4)
      .map((e) => ItemFood(food: e))
      .toList();
  static List<ItemFood> itemDrinks = FoodData.listFoods
      .where((element) => element.typeId == 5)
      .map((e) => ItemFood(food: e))
      .toList();
}
