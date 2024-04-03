import 'package:flutter/material.dart';

import 'package:untitled1/data/task_inherited.dart';
import 'package:untitled1/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    super.key,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'your tasks',
          style: TextStyle(color: Colors.white60),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
        elevation: 0,
      ),
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blueGrey[700],
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: TaskInherited.of(context).taskList,
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (contextNew) =>  FormScreen(taskContext: context,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
