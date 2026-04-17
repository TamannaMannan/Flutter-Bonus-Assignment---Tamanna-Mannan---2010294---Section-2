import 'package:flutter_ui_class/models/task_model.dart';
import 'package:flutter_ui_class/repositories/task_repository.dart';
import 'package:flutter_ui_class/widgets/task_card_widget.dart';
import 'package:flutter_ui_class/screens/add_task_page.dart';

class UiPage extends StatefulWidget {
  const UiPage({super.key});

  @override
  State<UiPage> createState() => _UiPageState();
}

class _UiPageState extends State<UiPage> {
  // Initialize your repository
  final TaskRepository _repository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Tasks"),
        backgroundColor: Colors.purpleAccent,
      ),

      // Task 6: Use StreamBuilder for Real-time updates
      body: StreamBuilder<List<TaskModel>>(
        stream: _repository.getTasks(), // This listens to the Firestore "tasks" collection
        builder: (context, snapshot) {
          // 1. Show a loading spinner while waiting for data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Handle Errors
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 3. Check if we have data
          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks found. Add one!"));
          }

          // 4. Display the live list
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskCardWidget(
                title: task.title,
                subtitle: task.description,
                // Adding delete functionality (Task 4 requirement)
                onDelete: () async {
                   await _repository.deleteTask(task.id);
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );
        },
        backgroundColor: Colors.purpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}