import 'package:flutter/material.dart';
import 'package:todo_app/mainpages/card_todolist_widget.dart';
import 'package:todo_app/mainpages/show_model.dart';
import 'package:todo_app/taskpage/task.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});
  @override
  State<TaskManager> createState() => TaskManagerState();
}

class TaskManagerState extends State<TaskManager> {
  final List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return CardToDoListWidget(
                  task: task,
                  onDelete: () {},
                  onToggleComplete: (bool? value) {},
                  onEdit: () {},
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNewTaskModel(onAddTask: addTask),
                ),
              );
            },
            child: Text('Add New Task'),
          ),
        ],
      ),
    );
  }
}
