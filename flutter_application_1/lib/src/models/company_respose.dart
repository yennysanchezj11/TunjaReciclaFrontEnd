import 'dart:convert';

import 'package:flutter_application_1/src/models/company.dart';

class InfoCompanyResponse {
  InfoCompanyResponse({
    required this.companys,
  });

  List<Company> companys;

  factory InfoCompanyResponse.fromJson(String str) =>
      InfoCompanyResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoCompanyResponse.fromMap(Map<String, dynamic> json) =>
      InfoCompanyResponse(
        companys:
            List<Company>.from(json["companys"].map((x) => Company.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "companys": List<dynamic>.from(companys.map((x) => x.toMap())),
      };
}
