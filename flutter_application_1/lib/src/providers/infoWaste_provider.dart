import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class InfoWasteProvider extends ChangeNotifier {
  String _baseUrl = 'backendtunjarecicla-production.up.railway.app';
  List<ListTypeWaste> infoCategoryWaste = [];

  InfoWasteProvider() {
    print('PROVIDER INICIALIZADO');
    getInfoWaste();
  }

  getInfoWaste() async {
    print('INFORMACIÓN DE CLASIFICACIÓN DE BASURAS');
    print('ENTRO A WASTE INFO');
    var url = Uri.http(_baseUrl, 'infoWaste');
    http.Response response = await http.get(url);
    final infoWaste = InfoWasteResponse.fromJson(response.body);
    print(infoWaste.list[0].type);
    infoCategoryWaste = infoWaste.list;
    notifyListeners();
  }
}
