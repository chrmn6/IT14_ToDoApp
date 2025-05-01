import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/provider/date_provider.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/provider/time_provider.dart';
import 'package:todo_app/taskpage/task.dart';
import 'package:todo_app/models/textfield_widget.dart';
import 'package:todo_app/models/category_widget.dart';
import 'package:todo_app/models/datetime_widget.dart';
import 'package:todo_app/models/buttons.dart';
import 'package:todo_app/utils/time.dart';

class AddNewTaskModel extends StatefulWidget {
  final Function(Task) onAddTask;

  const AddNewTaskModel({super.key, required this.onAddTask});

  @override
  State<AddNewTaskModel> createState() => AddNewTaskModelState();
}

class AddNewTaskModelState extends State<AddNewTaskModel> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  void submitTask(WidgetRef ref) {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      final date = ref.read(dateProvider);
      final time = ref.read(timeProvider);
      final categoryFolder = ref.read(radioProvider);

      final formattedDate = DateFormat.yMMMd().format(date);
      final formattedTime = Time.timeToString(time);

      String category;

      switch (categoryFolder) {
        case 1:
          category = 'Work';
          break;
        case 2:
          category = 'Personal';
          break;
        case 3:
          category = 'Academics';
          break;
        default:
          category = 'Unknown';
      }

      final task = Task(
        title: titleController.text,
        note: noteController.text,
        dateTime: '$formattedDate, $formattedTime',
        category: category,
      );

      widget.onAddTask(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Gap(5),
          Divider(thickness: 1.5, color: Colors.black),
          Gap(10),
          TextFieldWidget(
            title: "Task Title",
            hintText: "Title of the task",
            controller: titleController,
          ),
          Gap(20),
          TextFieldWidget(
            title: 'Note',
            hintText: 'Write something down',
            maxLines: 2,
            controller: noteController,
          ),
          Gap(20),
          const DateTimeWidget(),
          Gap(20),
          const CategoryFolder(),
          Gap(20),
          Consumer(
            builder: (context, ref, child) {
              return Buttons(onAdd: () => submitTask(ref));
            },
          ),
        ],
      ),
    );
  }
}
