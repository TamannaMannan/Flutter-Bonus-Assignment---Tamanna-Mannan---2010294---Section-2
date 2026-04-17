import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onDelete; // Important for Task 4!

  const TaskCardWidget({
    required this.title,
    required this.subtitle,
    this.onDelete,
  });
  @override
  Widget build(BuildContext context) {

    void _handleTap() {
      print("The card was tapped for $title: $subtitle");
    }

    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        leading: icon != null ? Icon(icon) : Icon(Icons.task),
        trailing: IconButton(
          onPressed: onTap ?? _handleTap,
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
