import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: const Text(
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        'History Blood Donatation'),
                  ),
                  const Icon(
                    Icons.forum,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/circle.png'),
                ),
                Positioned(
                    bottom: 3,
                    right: 3,
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.black,
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    "Le Van Anh"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(60, 50)),
                    ),
                    backgroundColor: const Color.fromARGB(202, 29, 232, 171)),
                child: const Text(
                    style: TextStyle(
                        color: Color.fromARGB(255, 252, 252, 252),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    'Level 2'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Color.fromARGB(255, 224, 224, 224),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 223, 223),
                      spreadRadius: 3),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          'Fourth'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          '24/01/2024'),
                      const Row(
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: Colors.grey,
                          ),
                          Text(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              '350 ml(Full)')
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: const Text(
                          'National Institute Of\nHematology And Blood Tranfusion',
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Color.fromARGB(255, 216, 175, 175),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 223, 223),
                      spreadRadius: 3),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          'Third'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          '24/05/2024'),
                      const Row(
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: Colors.grey,
                          ),
                          Text(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              '350 ml(Full)')
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: const Text(
                          'National Institute Of\nHematology And Blood Tranfusion',
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Color.fromARGB(255, 243, 148, 148),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 223, 223),
                      spreadRadius: 3),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          'Second'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          '24/07/2023'),
                      const Row(
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: Colors.grey,
                          ),
                          Text(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              '350 ml(Full)')
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: const Text(
                          'National Institute Of\nHematology And Blood Tranfusion',
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Color.fromARGB(255, 232, 101, 101),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 223, 223),
                      spreadRadius: 3),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          'First'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          '24/08/2023'),
                      const Row(
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: Colors.grey,
                          ),
                          Text(
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              '350 ml(Full)')
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: const Text(
                          'National Institute Of\nHematology And Blood Tranfusion',
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
