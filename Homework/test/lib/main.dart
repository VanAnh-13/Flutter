import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? check = false;
  bool? check2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Test',
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Board',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'All',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Tab(
                  child: Text(
                    'Uncompleted',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favorite',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.black, width: 0.0),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Checkbox(
                              value: check2,
                              onChanged: (bool? value) {
                                setState(
                                      () {
                                    check2 = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              "Làm việc cho chị...",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              'From: 07:34 PM - To: 07:34 PM',
                              style:
                              TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            Text(
                              'Deadline: 2024-01-01',
                              style:
                              TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Chua thay doi duoc tym
                                setState(() {
                                  const Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.black,
                                  )
                                });
                              },
                              icon: const Icon(
                                CupertinoIcons.heart,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black, width: 0.0),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Checkbox(
                              value: check,
                              onChanged: (bool? value) {
                                setState(
                                      () {
                                    check = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              'From: 07:34 PM - To: 07:34 PM',
                              style:
                              TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            Text(
                              'Deadline: 2024-01-01',
                              style:
                              TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Column(
                          children: [
                            Icon(
                              CupertinoIcons.heart,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
