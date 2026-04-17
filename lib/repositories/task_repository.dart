import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
  // Collection reference: 'tasks' is the folder name in Firestore
  final CollectionReference _taskCollection = 
      FirebaseFirestore.instance.collection('tasks');

  // addTask() - This fulfills Task 4.1
  Future<void> addTask(TaskModel task) async {
    // .add() takes your model and pushes it to the cloud
    await _taskCollection.add(task.toJson());
  }

  // deleteTask() - This fulfills Task 4.2
  Future<void> deleteTask(String docId) async {
    // .doc(id).delete() removes the specific task
    await _taskCollection.doc(docId).delete();
  }

  // This will be used for Task 6 (Real-time display)
  Stream<QuerySnapshot> getTasksStream() {
    return _taskCollection.snapshots();
  }
}