import 'dart:convert';

class Company {
  Company({
    required this.companyName,
    required this.logo,
    required this.info,
  });

  String companyName;
  String logo;
  String info;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        companyName: json["companyName"],
        logo: json["logo"],
        info: json["info"],
      );

  Map<String, dynamic> toMap() => {
        "companyName": companyName,
        "logo": logo,
        "info": info,
      };
}
