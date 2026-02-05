import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:sqflite_drift/core/sqflite-drift/database.dart';
import 'package:sqflite_drift/data/local/repository/impl/task_impl.dart';
import 'package:sqflite_drift/data/local/repository/task_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TaskRepository taskRepository;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskRepository = TaskImpl(AppDatabase());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drift Task App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    if (controller.text.isEmpty) return;
                    final result = await taskRepository.saveTask(
                      controller.text,
                    );

                    dev.log('Inserted task with id: $result');
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: taskRepository.watchAll(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final tasks = snapshot.data!;

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (_, index) {
                    final task = tasks[index];

                    return ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: task.isDone,
                        onChanged: (_) async {
                          await taskRepository.toggleDone(task);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
