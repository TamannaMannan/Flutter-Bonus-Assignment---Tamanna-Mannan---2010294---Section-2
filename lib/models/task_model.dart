// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'task_model.g.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

@JsonSerializable()
class TaskModel {
    @JsonKey(name: "id")
    String id;
    @JsonKey(name: "title")
    String title;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "createdAt")
    DateTime createdAt;

    TaskModel({
        required this.id,
        required this.title,
        required this.description,
        required this.createdAt,
    });

    factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

    Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
