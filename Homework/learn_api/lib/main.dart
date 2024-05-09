import 'package:flutter/material.dart';
import 'package:learn_api/data/providers.dart';
import 'package:learn_api/layout/add_screen.dart';
import 'package:learn_api/layout/layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProvinceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DistinctProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PartnerAdd(),
        ),
      ],
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabBar get _tabBar => const TabBar(
        indicatorColor: Colors.cyan,
        labelColor: Colors.cyan,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        labelStyle: TextStyle(fontSize: 25),
        tabs: [
          Text('Clients'),
          Text('Provider'),
        ],
      );

  @override
  void initState() {
    super.initState();
    context.read<PersonProvider>().getPersonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text(
              "Learn API",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.white,
                child: _tabBar,
              ),
            ),
          ),
          body: Center(
            child: context.watch<PersonProvider>().isLoadingPerson
                ? const CircularProgressIndicator()
                : TabBarView(
                    children: [
                      Container(
                        color: Colors.black12,
                        child: Stack(
                          children: [
                            Layout.displayData(
                                context
                                    .watch<PersonProvider>()
                                    .persons
                                    .where(
                                        (element) => element.isCustomer == true)
                                    .toList(),
                                context),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: Stack(
                          children: [
                            Layout.displayData(
                                context
                                    .watch<PersonProvider>()
                                    .persons
                                    .where((element) =>
                                        element.isCustomer == false)
                                    .toList(),
                                context),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(18),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.cyan),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddScreen(
                      isAdd: true,
                    ),
                  ),
                );
              },
              child: const Text(
                "Add partner",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
