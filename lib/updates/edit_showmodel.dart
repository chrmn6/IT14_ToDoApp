import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/updates/edit_category.dart';
import 'package:todo_app/updates/edit_datetime.dart';
import 'package:todo_app/updates/edit_textfield.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/taskpage/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/date_provider.dart';
import 'package:todo_app/provider/time_provider.dart';
import 'package:todo_app/utils/time.dart';

class EditTaskModel extends ConsumerStatefulWidget {
  final Task task;
  final Function(Task) onSave;

  const EditTaskModel({super.key, required this.task, required this.onSave});

  @override
  EditTaskModelState createState() => EditTaskModelState();
}

class EditTaskModelState extends ConsumerState<EditTaskModel> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  late String category;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _noteController = TextEditingController(text: widget.task.note);
    category = widget.task.category;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submitEdit() {
    final date = ref.read(dateProvider);
    final time = ref.read(timeProvider);
    final updatedDate = DateFormat.yMMMd().format(date);
    final updatedTime = Time.timeToString(time);
    final categoryFolder = ref.read(radioProvider);

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

    final updatedTask = widget.task.copyWith(
      title: _titleController.text,
      note: _noteController.text,
      category: category,
      dateTime: '$updatedDate, $updatedTime',
    );

    widget.onSave(updatedTask);
    Navigator.pop(context);
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
              'Edit Task',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Gap(5),
          Divider(thickness: 1.5, color: Colors.black),
          Gap(10),
          EditTextFieldWidget(
            title: "Task Title",
            hintText: "Title of the task",
            controller: _titleController,
          ),
          Gap(20),
          EditTextFieldWidget(
            title: 'Note',
            hintText: 'Write something down',
            maxLines: 2,
            controller: _noteController,
          ),
          Gap(20),
          const EditDateTime(),
          Gap(20),
          const EditCategoryFolder(),
          Gap(20),
          ElevatedButton(
            onPressed: _submitEdit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade300,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
