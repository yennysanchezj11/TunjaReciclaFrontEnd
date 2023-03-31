import 'package:flutter_application_1/src/ui/pages/pageInfo.dart';
import 'package:flutter_application_1/src/providers/companyInfo_Provider.dart';
import 'package:flutter_application_1/src/providers/infoWaste_provider.dart';
import 'package:flutter_application_1/src/providers/schedules_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Paquetes creados
import 'package:flutter_application_1/src/ui/pages/principalPage.dart';
import 'package:flutter_application_1/src/ui/pages/menuPage.dart';
import 'package:flutter_application_1/src/ui/pages/routeSearch.dart';
import 'package:flutter_application_1/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SchedulesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => InfoWasteProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CompanyInfoProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TunjaRecicla',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'), // English, no country code
          Locale('es', 'ES'), // Spanish, no country code
        ],
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => MenuPage());
          //builder: (BuildContext context) => SortOutPages());
        });
  }
}
