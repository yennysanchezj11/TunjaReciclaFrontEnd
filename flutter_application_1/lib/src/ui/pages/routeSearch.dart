// ignore_for_file: unnecessary_new

import 'package:flutter_application_1/src/models/company.dart';
import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter_application_1/src/providers/companyInfo_Provider.dart';
import 'package:flutter_application_1/src/ui/widgets/listViewSchedulers.dart';
import 'package:flutter_application_1/src/providers/schedules_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteSearch extends StatefulWidget {
  @override
  _RouteSearchState createState() => _RouteSearchState();
}

class _RouteSearchState extends State<RouteSearch> {
  final ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    final schedulersProvider = Provider.of<SchedulesProvider>(context);
    final companysProvider = Provider.of<CompanyInfoProvider>(context);
    final size = MediaQuery.of(context).size;
    List<Info> schedulersList = schedulersProvider.infoNeighBoorSchedules;
    List<Company> companysList = companysProvider.infoCompanysReceive;
    String dropdownvalue = schedulersList[0].neighborhood;
    List<Scheduler> schedulerInfoActual = [];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Image(
                    image: NetworkImage(
                        'https://i.postimg.cc/HkMcnydr/Icono-Atras.png'),
                    width: 50),
                onPressed: () {
                  Navigator.pushNamed(context, "/menuPage");
                });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: listViewSchedulers(size, schedulersList, dropdownvalue,
            schedulerInfoActual, companysList),
      ),
    );
  }
}
