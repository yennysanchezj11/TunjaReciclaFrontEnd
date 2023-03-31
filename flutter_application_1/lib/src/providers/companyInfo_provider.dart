import 'dart:io';

import 'package:flutter_application_1/src/models/company.dart';
import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/src/mock_client.dart';
import 'package:http/src/mock_client.dart';

class CompanyInfoProvider extends ChangeNotifier {
  String _baseUrl = 'backendtunjarecicla-production.up.railway.app';
  List<Company> infoCompanysReceive = [];

  CompanyInfoProvider() {
    print('PROVIDER INICIALIZADO');
    getCompanys();
  }
  /*Future<InfoCompanyResponse> getCallAll({required String endpoint}) async {
    var url = Uri.http(_baseUrl, endpoint);
    http.Response response = await http.get(url);
    final infoCompanys = InfoCompanyResponse.fromJson(response.body);
    if (response.statusCode == 400) {
      throw Exception();
    }
    return infoCompanys;
  }

  /* Future<InfoCompanyResponse> getCallAll(
      {required String endpoint, required Map<String, String> params}) async {
    var url = Uri.http(_baseUrl, endpoint, params);
    http.Response response = await http.get(url);
    final infoCompanys = InfoCompanyResponse.fromJson(response.body);
    if (response.statusCode == 400) {
      throw Exception();
    }
    return infoCompanys;
  }*/

  getSearchCompany() async {
    final result = await getCallAll(endpoint: 'searchCompanyAll');
    print(result.companys[1].companyName);
    infoCompanysReceive = result.companys;
    notifyListeners();
  }*/

  getCompanys() async {
    print('INFORMACIÓN DE EMPRESAS');
    var url = Uri.http(_baseUrl, 'searchCompanyAll');
    http.Response response = await http.get(url);
    final result = InfoCompanyResponse.fromJson(response.body);
    print(result.companys[1].companyName);
    infoCompanysReceive = result.companys;
    notifyListeners();
  }
}
