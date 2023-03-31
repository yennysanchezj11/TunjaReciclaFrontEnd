import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter_application_1/src/ui/widgets/TypeWaste.dart';
import 'package:flutter_application_1/src/providers/infoWaste_provider.dart';
import 'package:flutter_application_1/src/providers/schedules_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/backgroundPage.dart';

class SortOutPages extends StatefulWidget {
  @override
  _SortOutPagesState createState() => _SortOutPagesState();
}

class _SortOutPagesState extends State<SortOutPages>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final infoWasteProvider = Provider.of<InfoWasteProvider>(context);
    List<ListTypeWaste> listWasteInfo = infoWasteProvider.infoCategoryWaste;
    print(infoWasteProvider.infoCategoryWaste);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            //extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(228, 248, 255, 100),
              elevation: 0.0,
              bottom: TabBar(
                indicatorColor: Color(0xFF86F6C7),
                tabs: [
                  Text(listWasteInfo[0].type,
                      style: TextStyle(
                        color: Color(0xFF000000),
                      ),
                      textAlign: TextAlign.center),
                  Text(listWasteInfo[1].type,
                      style: TextStyle(
                        color: Color(0xFF000000),
                      ),
                      textAlign: TextAlign.center),
                  Text(listWasteInfo[2].type,
                      style: TextStyle(
                        color: Color(0xFF000000),
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
              title: Text(
                "Como clasificar tus residuos",
                style: TextStyle(
                  color: Color(0xFF000000),
                ),
              ),
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
            body: SafeArea(
                child: Column(
              children: [
                Expanded(
                    child: TabBarView(children: [
                  CreateContainer(listWasteInfo[0].categories),
                  CreateContainer(listWasteInfo[1].categories),
                  CreateContainer(listWasteInfo[2].categories)
                ]))
              ],
            ))));
  }

  Widget _miCardImage(
      String linkImage, String tittle, String description, String bgCard) {
    final colorCard = selectColor(bgCard);
    final foreColorCard = selectForeColor(bgCard);
    return Container(
        width: 150,
        height: 235,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TypeWaste2(
                        tittle: tittle,
                        image: linkImage,
                        description: description)))),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(top: 20.0),
                color: colorCard,
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      tittle,
                      style: TextStyle(fontSize: 16, color: foreColorCard),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                            placeholder: NetworkImage(
                                'https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
                            image: NetworkImage(linkImage),
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover),
                      ),
                    )),
                  ],
                ))));
  }

  Widget CreateContainer(List<Category> infoCategory) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 5.0),
      decoration: BackgroundPage.backgroundPageCreate(),
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Row(
              children: [
                _miCardImage(infoCategory[0].image, infoCategory[0].name,
                    infoCategory[0].description, infoCategory[0].color),
                _miCardImage(infoCategory[1].image, infoCategory[1].name,
                    infoCategory[1].description, infoCategory[1].color),
              ],
            ),
            _miCardImage(infoCategory[2].image, infoCategory[2].name,
                infoCategory[2].description, infoCategory[2].color),
            SizedBox(
              height: 30,
            ),
            _createLogo()
          ])),
    );
  }

  Widget _createLogo() {
    print("CREA EL LOGO");
    return Image(
        image: NetworkImage("https://i.postimg.cc/FznyNY2F/AppLogo.png"),
        width: 200);
  }

  int _numberPage(String page, List<ListTypeWaste> infoWasteProvider) {
    int page = 0;
    for (var i = 0; i < infoWasteProvider.length; i++) {
      if (infoWasteProvider[i].type == page) {
        page = i;
      }
    }
    return page;
  }
}

Color selectForeColor(String bgCard) {
  Color colorForeSelect = Colors.black;
  switch (bgCard) {
    case "sinColor":
      colorForeSelect = Colors.black;
      break;
    case "Blanco":
      colorForeSelect = Colors.black;
      break;
    case "Negro":
      colorForeSelect = Colors.white;
      break;
    case "Verde":
      colorForeSelect = Colors.black;
      break;
    default:
  }
  return colorForeSelect;
}

Color selectColor(String bgCard) {
  Color colorSelect = Colors.white;
  switch (bgCard) {
    case "sinColor":
      colorSelect = Color.fromRGBO(148, 235, 206, 100);
      break;
    case "Blanco":
      colorSelect = Colors.white;
      break;
    case "Negro":
      colorSelect = Colors.black;
      break;
    case "Verde":
      colorSelect = Color.fromRGBO(82, 161, 52, 100);
      break;
    default:
  }
  return colorSelect;
}
