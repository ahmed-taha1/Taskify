import 'dart:convert';

class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  // TODO test note empty
  Task(
      {this.id,
      this.title,
      this.note = ' ',
      this.isCompleted = 0,
      this.date,
      this.startTime,
      this.endTime,
      this.color,
      this.remind,
      this.repeat});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'repeat': repeat,
      'color': color,
      'isCompleted': isCompleted,
      'remind': remind,
    };
  }

  Task.fromMap(Map<String, dynamic> map){
      id= map['id'];
      title= map['title'];
      note= map['note'];
      date= map['date'];
      startTime= map['startTime'];
      endTime= map['endTime'];
      repeat= map['repeat'];
      color= map['color'];
      isCompleted= map['isCompleted'];
      remind= map['remind'];
  }

  // factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
