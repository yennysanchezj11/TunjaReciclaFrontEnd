import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class SchedulesProvider extends ChangeNotifier {
  String _baseUrl = 'backendtunjarecicla-production.up.railway.app';
  List<Info> infoNeighBoorSchedules = [];

  SchedulesProvider() {
    print('PROVIDER INICIALIZADO');
    getSearchSchedules2();
  }

  getSearchSchedules2() async {
    print('ENTRO A SCHEDULER');
    var url = Uri.http(_baseUrl, 'all');
    http.Response response = await http.get(url);
    final neight = NeighborhoodResponse.fromJson(response.body);
    print(neight.info[1].neighborhood);
    infoNeighBoorSchedules = neight.info;
    notifyListeners();
  }

  Future<NeighborhoodResponse> getCall({required String endpoint}) async {
    var url = Uri.http(_baseUrl, endpoint);
    http.Response response = await http.get(url);
    final infoSchedulers = NeighborhoodResponse.fromJson(response.body);
    if (response.statusCode == 400) {
      throw Exception();
    }
    return infoSchedulers;
  }

  /* getSearchSchedules2() async {
    print('ENTRO A SCHEDULER');
    var url = Uri.http(_baseUrl, 'all');
    http.Response response = await http.get(url);
    final neight = NeighborhoodResponse.fromJson(response.body);
    print(neight.info[1].neighborhood);
    infoNeighBoorSchedules = neight.info;
    notifyListeners();
  }*/

  getSearch() async {
    print('ENTRO A SCHEDULER');
    final result = await getCall(endpoint: 'all');
    infoNeighBoorSchedules = result.info;
    notifyListeners();
  }
}
