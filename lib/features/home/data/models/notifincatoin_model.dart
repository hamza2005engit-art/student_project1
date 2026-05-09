



import 'package:student_project1/features/home/domain/entities/notifincatins_user.dart';

class NotifincationModel extends NotifincationUser {
  NotifincationModel({

    required super.date,
    required super.content,
    required super.title,

    super.token
  });

  factory NotifincationModel.fromJson(Map<String, dynamic> json) {
    return NotifincationModel(
      date: json['date'],
      content: json['content'],
      title: json['title'],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'content': content,
      'title': title,

    };
  }

}