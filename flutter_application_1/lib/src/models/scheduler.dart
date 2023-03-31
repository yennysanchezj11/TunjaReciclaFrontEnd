import 'dart:convert';

class Scheduler {
  Scheduler({
    required this.day,
    required this.hour,
    required this.company,
  });

  dynamic day;
  dynamic hour;
  String company;

  factory Scheduler.fromJson(String str) => Scheduler.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Scheduler.fromMap(Map<String, dynamic> json) => Scheduler(
        day: json["day"],
        hour: json["hour"]!,
        company: json["company"]!,
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "hour": hour,
        "company": company,
      };
}
