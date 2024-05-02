import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8/cart.dart';
import 'package:week8/data.dart';
import 'package:week8/item.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: const MaterialApp(
        home: ShopFood(),
      ),
    ),
  );
}

class ShopFood extends StatefulWidget {
  const ShopFood({super.key});

  @override
  State<ShopFood> createState() => _ShopFoodState();
}

class _ShopFoodState extends State<ShopFood> {
  Item item = Item();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              indicatorColor: Colors.orange,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              labelStyle: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                overflow: TextOverflow.clip,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                overflow: TextOverflow.clip,
              ),
              tabs: List.generate(
                FoodData.typeOfFood.length,
                (index) => Tab(
                  text: FoodData.typeOfFood[index].nameOfType,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 0)
                      .toList(),
                  "Sashimi"),
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 1)
                      .toList(),
                  "Sushi lẻ và tổng hợp"),
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 2)
                      .toList(),
                  "Maki, cơm cuộn"),
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 3)
                      .toList(),
                  "Combo Sashimi + Sushi & Maki + ..."),
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 4)
                      .toList(),
                  "Món nóng, salat"),
              item.item(
                  FoodData.listFoods
                      .where((element) => element.typeId == 5)
                      .toList(),
                  "Đồ uống"),
            ],
          ),
          bottomNavigationBar: item.bottomNavigationBar(context),
        ),
      ),
    );
  }
}
