import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      'Hi, Le Van Anh'),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(18, 20)),
                              border: Border.all(
                                  width: 2,
                                  color: const Color.fromARGB(
                                      255, 151, 151, 151))),
                          child: const Icon(
                            Icons.notification_add_rounded,
                            color: Color.fromARGB(255, 6, 6, 6),
                          ),
                        )),
                  ),
                ],
              )),
          Container(
              margin: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Color.fromARGB(255, 224, 224, 224),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 223, 223, 223),
                      spreadRadius: 3),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: const Text(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        'Thời khoá biểu'),
                                  ),
                                  const Text(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      '20 tháng 2')
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(60, 50)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(203, 29, 56, 232)),
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 252, 252, 252),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                'Lịch thi'),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              'Không có lịch!'),
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Xem thêm TKB',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: -40,
                    left: 10,
                    child: Image.asset(
                      'assets/images/img.png',
                      width: 100,
                    ),
                  )
                ],
              )),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Row(
              children: [
                Text(
                  'Thông báo gần đây',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
              color: Color.fromARGB(255, 224, 224, 224),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 223, 223, 223), spreadRadius: 3),
              ],
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 95, 159),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    'THÔNG BÁO V/v mở, không mở các lớp học phần trong học kỳ 2\nnăm học 2023-2024 cho sinh viên Đại học các khóa',
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 20),
                      child: Icon(
                        Icons.schedule,
                        size: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 20),
                      child: Text(
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          '3:30 02/02/2004'),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 20),
              child: const Row(
                children: [
                  Text(
                    'Tiện ích',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              )),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.payments,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Tài chính'),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.bar_chart,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Kết quả HP'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.description,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Học Phần'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.school,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Tốt nghiệp'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.phone,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'DV một cửa'),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.bookmark,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Đánh giá rèn luyện'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.question_mark,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Hỏi đáp'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Color.fromARGB(255, 224, 224, 224),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              spreadRadius: 3),
                        ],
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.check,
                        color: Color.fromARGB(255, 17, 95, 159),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          'Khảo sát'),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
