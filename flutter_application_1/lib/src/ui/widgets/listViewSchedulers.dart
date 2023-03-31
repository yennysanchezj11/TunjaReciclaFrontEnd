import 'package:flutter_application_1/src/models/company.dart';
import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter_application_1/src/ui/widgets/backgroundPage.dart';
import 'package:flutter_application_1/src/providers/schedules_provider.dart';
import 'package:flutter_application_1/src/providers/companyInfo_Provider.dart';
import 'package:flutter_application_1/src/ui/widgets/button_company.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class listViewSchedulers extends StatefulWidget {
  listViewSchedulers(this.size, this.schedulersList, this.dropdownvalue,
      this.schedulerInfoActual, this.companysList,
      {Key? key})
      : super(key: key);
  Size size;
  List<Info> schedulersList;
  String dropdownvalue;
  List<Scheduler> schedulerInfoActual;
  List<Company> companysList;

  @override
  _listViewSchedulersState createState() => _listViewSchedulersState();
}

class _listViewSchedulersState extends State<listViewSchedulers> {
  final ScrollController scrollController = new ScrollController();
  TextStyle textStyleP = TextStyle(fontSize: 13);
  @override
  Widget build(BuildContext context) {
    widget.schedulersList.sort((scheduler1, scheduler2) =>
        scheduler1.neighborhood.compareTo(scheduler2.neighborhood));
    return Container(
        decoration: BackgroundPage.backgroundPageCreate(),
        padding: EdgeInsets.only(top: 70, right: 20, left: 20, bottom: 15),
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(children: [
          DropdownButtonFormField(
            icon: Icon(Icons.house_rounded),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            dropdownColor: Colors.cyan.shade50,
            value: widget.dropdownvalue,
            onChanged: (String? newValue) {
              Info info = (widget.schedulersList
                  .firstWhere((item) => item.neighborhood == newValue));
              widget.schedulerInfoActual = info.schedulers;
              widget.dropdownvalue = newValue!;
              setState(() {});
            },
            items: widget.schedulersList.map((Info item) {
              return DropdownMenuItem(
                value: item.neighborhood,
                child: Text(
                  item.neighborhood,
                  style: TextStyle(fontSize: 13.5),
                ),
              );
            }).toList(),
          ),
          ButtonCompany(widget.schedulerInfoActual, widget.companysList),
          SizedBox(
            height: 10.0,
          ),
          _createImage(),
          SizedBox(
            height: 10.0,
          ),
          _createLogo(),
        ]));
  }

  Widget _createLogo() {
    print("CREA EL LOGO");
    return Image(
        image: NetworkImage('https://i.postimg.cc/FznyNY2F/AppLogo.png'),
        width: 200);
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: NetworkImage('https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
      image: NetworkImage('https://i.postimg.cc/L6pBq6DH/Camion-Basura.gif'),
      height: 200,
      width: double.infinity,
    );
  }
}
