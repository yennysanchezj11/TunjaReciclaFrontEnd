import 'dart:async';
import 'package:flutter_application_1/src/ui/widgets/backgroundPage.dart';
import 'package:flutter_application_1/src/ui/pages/principalPage.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
            decoration: BackgroundPage.backgroundPageCreate(),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _createMenu(),
                      SizedBox(
                        height: 120.0,
                      ),
                      _createLogo()
                    ]),
              ),
            )));
  }

  Widget _createLogo() {
    return Image(
        image: NetworkImage("https://i.postimg.cc/FznyNY2F/AppLogo.png"),
        width: 200);
  }

  Widget _createMenu() {
    return Column(children: <Widget>[
      _createButton("https://i.postimg.cc/L5jhyd5m/reciclaje.png",
          "Como clasificar tus residuos", "pageInfo"),
      SizedBox(
        height: 130.0,
      ),
      _createButton("https://i.postimg.cc/05KS6F8W/camion.png",
          "Rutas y horarios de recolección", "routeSearch"),
    ]);
  }

  Widget _createButton(String image, String text, String route) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Color.fromRGBO(148, 235, 206, 40),
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(vertical: 30.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );

    TextButton textButton = TextButton(
        key: Key(route),
        style: flatButtonStyle,
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: ListTile(
            leading: FadeInImage(
                placeholder:
                    NetworkImage('https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
                image: NetworkImage(image),
                width: 100),
            title: Text(
              text,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
            ),
            textColor: Colors.black));
    return textButton;
  }
}
