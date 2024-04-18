import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static List<Task> all = [
    Task(
        title: "Làm việc cho chị ...",
        startTime: "7:30 PM",
        endTime: "7:34 PM",
        deadline: "2023-01-01",
        color: Colors.greenAccent),
    Task(
        title: "Hello",
        startTime: "7:30 PM",
        endTime: "7:34 PM",
        deadline: "2023-01-01",
        color: Colors.purpleAccent)
  ];
  static List<Task> uncompleted = [];
  static List<Task> completed = [];
  static List<Task> favorite = [];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: MyApp.all.length,
              itemBuilder: (BuildContext context, int index) {
                return MyApp.all[index];
              },
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: MyApp.uncompleted,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: MyApp.completed,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: MyApp.favorite,
            )
          ],
        ),
        bottomNavigationBar: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(5, 205, 255, 100),
            ),
          ),
          onPressed: () async {
            final Task taskAdd = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTask(),
              ),
            );

            setState(() {
              MyApp.all.add(taskAdd);
              print(taskAdd.title);
            });
          },
          child: const Text(
            "Add a task",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  static void addFavorite(List<Widget> widget, bool isFavor, Task task) {
    if (isFavor) {
      widget.add(task);
    } else if (!isFavor) {
      widget.remove(task);
    }
  }

  static void addCompleted(List<Widget> complete, List<Widget> uncompleted,
      bool isComplete, Task task) {
    if (isComplete && !complete.contains(task)) {
      complete.add(task);

      if (uncompleted.contains(task)) {
        uncompleted.remove(task);
      }
    } else if (!isComplete && !uncompleted.contains(task)) {
      uncompleted.add(task);

      if (complete.contains(task)) {
        complete.remove(task);
      }
    }
  }
}

class Task extends StatefulWidget {
  Task({super.key,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.deadline,
    required this.color,
    this.remind,
    this.repeat});

  final String title;
  final String? startTime;
  final String? endTime;
  final String? deadline;
  final Color? color;
  final String? remind;
  final String? repeat;
  bool isFavorite = false;
  bool isCompleted = false;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  void initState() {
    super.initState();
    _MyAppState.addCompleted(
        MyApp.completed, MyApp.uncompleted, widget.isCompleted, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
            value: widget.isCompleted,
            onChanged: (bool? value) {
              setState(
                    () {
                  _MyAppState.addCompleted(
                      MyApp.completed, MyApp.uncompleted, value!, widget);
                  widget.isCompleted = value;
                },
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Text(
                'From: ${widget.startTime} - To: ${widget.endTime}',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
              Text(
                'Deadline: ${widget.deadline}',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              )
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.isFavorite = !widget.isFavorite;
                _MyAppState.addFavorite(
                    MyApp.favorite, widget.isFavorite, widget);
              });
            },
            icon: widget.isFavorite
                ? const Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            )
                : const Icon(
              CupertinoIcons.heart,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AddTask extends StatefulWidget {
  AddTask({super.key});

  TimeOfDay timeStart = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay timeEnd = const TimeOfDay(hour: 0, minute: 0);
  static final remindList = [
    '10 minute early',
    '30 minute early',
    '1 hour early'
  ];
  static final repeatList = ['weekly', 'monthly', 'yearly'];
  final checkBoxColor = [
    CheckBoxColor(color: Colors.red, value: false),
    CheckBoxColor(color: Colors.yellow, value: false),
    CheckBoxColor(color: Colors.green, value: false),
    CheckBoxColor(color: Colors.blue, value: false),
    CheckBoxColor(color: Colors.purple, value: false)
  ];
  late String title;
  String? remindValue;
  String? repeatValue;
  Color? taskColor;
  String date = "01/01/2000";

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add a new task",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gapPadding: BorderSide.strokeAlignCenter),
                    ),
                    onChanged: (value) {
                      widget.title = value;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deadline",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.date,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );

                              if (newDate == null) return;

                              setState(() {
                                widget.date = "${newDate.day.toString().padLeft(
                                    2, '0')}/${newDate.month.toString()
                                    .padLeft(2, '0')}/${newDate.year}";
                              });
                            },
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.timeStart.hour.toString().padLeft(
                                    2, '0')} : ${widget.timeStart.minute
                                    .toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                      context: context,
                                      initialTime: widget.timeStart);

                                  if (newTime == null) return;

                                  setState(() {
                                    widget.timeStart = newTime;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.time),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "End",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.timeEnd.hour.toString().padLeft(
                                    2, '0')} : ${widget.timeEnd.minute
                                    .toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                      context: context,
                                      initialTime: widget.timeEnd);

                                  if (newTime == null) return;

                                  setState(() {
                                    widget.timeEnd = newTime;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.time),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Remind",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              value: widget.remindValue,
                              items: AddTask.remindList
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  widget.remindValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Repeat",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              value: widget.repeatValue,
                              items: AddTask.repeatList
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  widget.repeatValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: widget.checkBoxColor.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: widget.checkBoxColor[index].color,
                                shape: BoxShape.rectangle,
                                border: Border.all(width: 0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                              child: Checkbox(
                                value: widget.checkBoxColor[index].value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.checkBoxColor[index].value =
                                    !widget.checkBoxColor[index].value;
                                    widget.taskColor =
                                        widget.checkBoxColor[index].color;
                                  });
                                },
                                activeColor: widget.checkBoxColor[index].color,
                              ),
                            );
                          },
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, crossAxisSpacing: 50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(5, 205, 255, 100),
          ),
        ),
        onPressed: () {
          Navigator.pop(
            context,
            Task(
              title: widget.title,
              deadline: widget.date,
              startTime: widget.timeStart.format(context),
              endTime: widget.timeEnd.format(context),
              remind: widget.remindValue,
              repeat: widget.repeatValue,
              color: widget.taskColor,
            ),
          );
        },
        child: const Text(
          "Create a task",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CheckBoxColor {
  final Color color;
  bool value;

  CheckBoxColor({required this.color, this.value = false});
}
