import 'package:flutter/material.dart';

//Paquetes creados
import 'package:flutter_application_1/src/ui/pages/principalPage.dart';
import 'package:flutter_application_1/src/ui/widgets/TypeWaste.dart';
import 'package:flutter_application_1/src/ui/pages/menuPage.dart';
import 'package:flutter_application_1/src/ui/pages/pageInfo.dart';
import 'package:flutter_application_1/src/ui/pages/routeSearch.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => PrincipalPage(),
    '/menuPage': (BuildContext context) => MenuPage(),
    'routeSearch': (BuildContext context) => RouteSearch(),
    // 'alert': (BuildContext context) => AlertPage(),
    'pageInfo': (BuildContext context) => SortOutPages(),
    //'pageTypeWaste': (BuildContext context) => TypeWaste2(),
    // '/' : (BuildContext context) => CardPage(),
  };
}
