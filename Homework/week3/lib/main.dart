import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:week3/random_math.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _status = 0;
  int _score = 0;
  int _highScore = 0;
  String _calculate = "";
  final CountdownController _controller = CountdownController(autoStart: true);
  final RandomMath _randomMath = RandomMath();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: _status == 0
            ? _homeScreen()
            : _status == 1
                ? _secondScreen()
                : _thirdScreen(),
      )),
    );
  }

  Container _homeScreen() {
    return Container(
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                    style: TextStyle(color: Colors.amber, fontSize: 30),
                    "Welcome "),
                Text(style: TextStyle(color: Colors.cyan, fontSize: 30), "to"),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                    style: TextStyle(color: Colors.greenAccent, fontSize: 38),
                    "Freaking"),
                Text(
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 43,
                        fontWeight: FontWeight.bold),
                    "Math")
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
                style: TextStyle(color: Colors.redAccent, fontSize: 30),
                "Please click here to play"),
            IconButton(
                onPressed: () {
                  setState(() {
                    _status = 1;
                    _randomMath.makeQuiz();
                    _calculate = _randomMath.finalResult;
                  });
                },
                icon: const Icon(
                  size: 50,
                  Icons.play_circle,
                  color: Colors.blue,
                )),
          ],
        ));
  }

  Container _secondScreen() {
    return Container(
      color: const Color.fromRGBO(240, 128, 128, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$_score",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white),
              )
            ],
          ),
          Countdown(
            controller: _controller,
            seconds: 5,
            build: (_, double time) => Text(
              time.toInt().toString(),
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white
              ),
            ),
            interval: const Duration(seconds: 1),
            onFinished: (){
              setState(() {
                _status = 2;
              });
            },
          ),

          SizedBox(
            width: 350,
            child: Text(
              _calculate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: Row(
              children: [
                RawMaterialButton(
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    fillColor: const Color.fromRGBO(154, 205, 50, 100),
                    onPressed: () {
                      if (_randomMath.result) {
                        _score++;
                        _highScore++;
                        _randomMath.makeQuiz();
                        _calculate = _randomMath.finalResult;
                        _controller.restart();
                      } else {
                        setState(() {
                          _status = 2;
                        });
                      }

                      setState(() {
                        _calculate;
                      });
                    },
                    child: const Icon(
                      Icons.check,
                      color: Color.fromRGBO(0, 0, 139, 100),
                      size: 60,
                    )),
                const SizedBox(
                  width: 70,
                ),
                RawMaterialButton(
                  padding: const EdgeInsets.all(10),
                  fillColor: Colors.redAccent,
                  shape: const CircleBorder(),
                  onPressed: () {
                    if (_randomMath.result) {
                      setState(() {
                        _status = 2;
                      });
                    } else {
                      _score++;
                      _highScore++;
                      _randomMath.makeQuiz();
                      _calculate = _randomMath.finalResult;
                      _controller.restart();
                    }

                    setState(() {
                      _calculate;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: Color.fromRGBO(128, 0, 0, 100),
                    size: 60,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _thirdScreen() {
    return Container(
      color: const Color.fromRGBO(144, 238, 144, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GAME OVER",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                "CURRENT:",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text("$_score",
                  style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const Text(
                "BEST:",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text("$_highScore",
                  style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _status = 0;
                    _score = 0;
                    _highScore = 0;
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.home,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _status = 1;
                    _score = 0;
                    _randomMath.makeQuiz();
                    _calculate = _randomMath.finalResult;
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  CupertinoIcons.reply,
                  size: 60,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
