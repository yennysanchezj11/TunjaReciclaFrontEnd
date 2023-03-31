import 'package:flutter_application_1/src/models/company.dart';
import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter_application_1/src/providers/schedules_provider.dart';
import 'package:flutter_application_1/src/providers/companyInfo_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCompany extends StatefulWidget {
  ButtonCompany(this.list, this.companysList, {Key? key}) : super(key: key);
  List<Scheduler> list;
  List<Company> companysList;
  @override
  State<ButtonCompany> createState() => _ButtonCompanyState();
}

class _ButtonCompanyState extends State<ButtonCompany> {
  @override
  Widget build(BuildContext context) {
    List<Company> listCompany = widget.companysList;
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 0),
        width: double.infinity,
        height: size.height * 0.4,
        child: CreateList(widget.list, listCompany));
  }
}

Widget CreateList(List<Scheduler> list, List<Company> listCompany) {
  if (list.isNotEmpty) {
    print("LISTA NO VACIA");
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return createContainer(list, listCompany, index);
        },
      ),
    );
  } else {
    print("LISTA VACIA");
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          "RUTAS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 50,
            color: Color.fromRGBO(23, 156, 52, 0.612),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Y",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 50,
            color: Color.fromRGBO(48, 173, 75, 0.612),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "HORARIOS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 50,
            color: Color.fromRGBO(5, 110, 28, 0.612),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

Widget createContainer(
  list,
  listCompany,
  index,
) {
  double margin = 0;
  if (list.length == 1) {
    margin = 60;
  }
  return Container(
    //width: 200,
    //height: 260,
    margin: EdgeInsets.symmetric(horizontal: margin, vertical: 10),
    child: Container(
      child: CreateMenu(
          index: list.length,
          infoScheduler: list[index],
          infoCompany: listCompany),
    ),
  );
}

class CreateMenu extends StatefulWidget {
  CreateMenu({
    super.key,
    required this.index,
    required this.infoScheduler,
    required this.infoCompany,
  });
  int index;
  Scheduler infoScheduler;
  List<Company> infoCompany;

  @override
  State<CreateMenu> createState() => _CreateMenuState();
}

class _CreateMenuState extends State<CreateMenu> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    Company compa =
        validateCompany(widget.infoScheduler.company, widget.infoCompany);
    if (widget.index <= 1) {
      return Container(
        width: 180,
        height: double.infinity,
        child: this._createButton(
            compa.logo,
            compa.companyName,
            widget.infoScheduler.day,
            compa.info,
            widget.infoScheduler.hour,
            'assets/clic.png',
            context),
      );
    } else {
      return Center(
        child: Row(children: [
          Container(
            width: 180,
            height: double.infinity,
            child: this._createButton(
                compa.logo,
                compa.companyName,
                widget.infoScheduler.day,
                compa.info,
                widget.infoScheduler.hour,
                'https://i.postimg.cc/3NwXsXfb/clic.png',
                context),
          ),
          SizedBox(width: 5),
          // Icon(Icons.keyboard_tab_rounded, color: Colors.white)
        ]),
      );
    }
  }

  Widget _createButton(String imageCompany, String company, String days,
      String textContent, String hours, String image, BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Color.fromRGBO(148, 235, 206, 100),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );
    return TextButtonScheduler(
        image: image,
        company: company,
        imageCompany: imageCompany,
        days: days,
        flatButtonStyle: flatButtonStyle,
        hours: hours,
        textContent: textContent);
  }

  Company validateCompany(String name, List<Company> infoCompany) {
    Company comp = Company(companyName: "", info: " ", logo: " ");
    for (var i = 0; i < infoCompany.length; i++) {
      if (infoCompany[i].companyName == name) {
        comp = infoCompany[i];
      }
    }
    return comp;
  }
}

class TextButtonScheduler extends StatefulWidget {
  String imageCompany, company, days, textContent, image, hours;
  ButtonStyle flatButtonStyle;

  TextButtonScheduler(
      {super.key,
      required this.imageCompany,
      required this.company,
      required this.days,
      required this.textContent,
      required this.hours,
      required this.image,
      required this.flatButtonStyle});

  @override
  State<TextButtonScheduler> createState() => _TextButtonSchedulerState();
}

class _TextButtonSchedulerState extends State<TextButtonScheduler> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(11, 247, 149, 0.463),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        children: [
          SizedBox(height: 10),
          FadeInImage(
              placeholder:
                  NetworkImage('https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
              image: NetworkImage(widget.imageCompany),
              width: 160,
              height: 100),
          SizedBox(
            height: 10,
          ),
          Text(widget.company,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(
            height: 5,
          ),
          Text("Día(s): " + widget.days,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center),
          SizedBox(
            height: 5,
          ),
          Text("Hora: " + widget.hours,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () =>
                displayDialog(context, widget.imageCompany, widget.textContent),
            child: Expanded(
              child: FadeInImage(
                  placeholder: NetworkImage(
                      'https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
                  image: NetworkImage('https://i.postimg.cc/3NwXsXfb/clic.png'),
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40),
            ),
          ),
        ],
      ),
    );
  }

  void displayDialog(
      BuildContext context, String imageCompany, String textContent) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Color.fromRGBO(148, 235, 206, 40),
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    );
    List<String> splits = textContent.split('-');
    for (String item in splits) {
      print(item);
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: Container(
              child: Image(
                  image: NetworkImage(
                      'https://i.postimg.cc/FznyNY2F/AppLogo.png')),
              width: 30,
              height: 20,
              alignment: Alignment.bottomRight,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeInImage(
                  placeholder: NetworkImage(
                      'https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
                  image: NetworkImage(imageCompany),
                  width: 120,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 400,
                  height: 130,
                  child: ListView.builder(
                    itemCount: splits.length,
                    itemBuilder: (_, int index) {
                      return Text(
                        splits[index],
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      );
                    },
                  ),
                )
              ],
            ),
            actions: [
              Center(
                  child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () => {Navigator.pop(context)},
                      child: Text("Cerrar")))
            ],
          );
        });
  }
}
