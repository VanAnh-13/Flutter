import 'package:week8/data.dart';

class ItemFood {
  final int idFood;
  bool isVisible;
  int count;

  ItemFood({required this.idFood, this.isVisible = true, this.count = 0});
}

class DataItem {
  static List<ItemFood> listItems = [];
}
