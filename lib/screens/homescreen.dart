import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/components/notepad.dart';
import 'package:todo/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> todoTasks = [];

  @override
  void initState() {
    super.initState();
    loadToDoTasks();
  }

  void loadToDoTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todoTasks = prefs
              .getStringList('todoTasks')
              ?.map((task) => parseTask(task))
              .toList() ??
          [];
    });
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'todoTasks', todoTasks.map((task) => jsonEncode(todoTasks)).toList());
  }

  Map<String, dynamic> parseTask(String task) {
    return jsonDecode(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: todoTasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Text("${todoTasks[index]}"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  todoTasks.removeAt(index);
                                  saveTasks();
                                });
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                                color: Colors.lightGreen,
                              ))
                        ],
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (cnt) => NotePad());
          },
          tooltip: 'Increment',
          splashColor: Colors.deepPurple,
          backgroundColor: Colors.deepPurpleAccent.withOpacity(1),
          hoverColor: const Color.fromARGB(255, 155, 125, 207),
          // child: const Icon(Icons.add),
          child: Image.asset(
            'assets/icons/plus.png',
            scale: 12.0,
          )),
    );
  }
}
