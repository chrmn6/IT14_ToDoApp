import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/models/search_query.dart';
import 'package:todo_app/updates/edit_showmodel.dart';
import 'package:todo_app/mainpages/card_todolist_widget.dart';
import 'package:todo_app/mainpages/menu_drawer.dart';
import 'package:todo_app/mainpages/show_model.dart';
import 'package:todo_app/provider/task_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskProvider);
    final filteredTasks =
        tasks.where((task) {
          return task.title.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.amber.shade600),
          ),
        ],
      ),
      drawer: TodoAppDrawer(username: widget.username),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskSearchBox(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              Gap(15),
              Text(
                'MY TO-DO LISTS',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Gap(20),
              ListView.separated(
                itemCount: filteredTasks.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];
                  return CardToDoListWidget(
                    task: task,
                    onDelete: () {
                      ref.read(taskProvider.notifier).deleteTask(index);
                    },
                    onToggleComplete: (value) {
                      ref.read(taskProvider.notifier).toggleCompletion(index);
                    },
                    onEdit: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        context: context,
                        builder:
                            (context) => EditTaskModel(
                              task: task,
                              onSave: (updatedTask) {
                                ref
                                    .read(taskProvider.notifier)
                                    .updateTask(index, updatedTask);
                              },
                            ),
                      );
                    },
                  );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade300,
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder:
                (context) => AddNewTaskModel(
                  onAddTask: (task) {
                    ref.read(taskProvider.notifier).addTask(task);
                  },
                ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
