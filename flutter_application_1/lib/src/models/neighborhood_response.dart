import 'dart:convert';

import 'package:flutter_application_1/src/models/models.dart';

class NeighborhoodResponse {
  NeighborhoodResponse({
    required this.info,
  });

  List<Info> info;

  factory NeighborhoodResponse.fromJson(String str) =>
      NeighborhoodResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NeighborhoodResponse.fromMap(Map<String, dynamic> json) =>
      NeighborhoodResponse(
        info: List<Info>.from(json["info"].map((x) => Info.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": List<dynamic>.from(info.map((x) => x.toMap())),
      };
}

class Info {
  Info({
    required this.neighborhood,
    required this.schedulers,
  });

  String neighborhood;
  List<Scheduler> schedulers;

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        neighborhood: json["neighborhood"],
        schedulers: List<Scheduler>.from(
            json["schedulers"].map((x) => Scheduler.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "neighborhood": neighborhood,
        "schedulers": List<dynamic>.from(schedulers.map((x) => x.toMap())),
      };
}
