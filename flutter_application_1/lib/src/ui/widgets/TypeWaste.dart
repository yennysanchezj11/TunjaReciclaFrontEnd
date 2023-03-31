import 'package:flutter_application_1/src/models/models.dart';
import 'package:flutter_application_1/src/ui/widgets/backgroundPage.dart';
import 'package:flutter/material.dart';

class TypeWaste2 extends StatelessWidget {
  final String tittle, image, description;

  const TypeWaste2(
      {super.key,
      required this.tittle,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    Navigator.pushNamed(context, "pageInfo",
                        arguments: this.tittle);
                  });
            },
          ),
        ),
        body: Expanded(
          child: Container(
              decoration: BackgroundPage.backgroundPageCreate(),
              padding: EdgeInsets.only(top: 100.0, left: 30, right: 30),
              child: Stack(
                children: [
                  _createCard(tittle, description, image,
                      Color.fromRGBO(148, 235, 206, 100), Colors.black),
                  _createLogo()
                ],
              )),
        ));
  }

  Widget _createCard(String tittle, String description, String image,
      Color bgCard, Color fontColor) {
    List<String> splits = description.split('-');
    for (String item in splits) {
      print(item);
    }
    return Container(
      child: Column(
        children: [
          Text(
            tittle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 26,
            ),
          ),
          SizedBox(height: 15),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 20.0, left: 8, right: 6),
              color: bgCard,
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    margin: EdgeInsets.only(
                        top: 30, bottom: 20.0, left: 5, right: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                            placeholder: NetworkImage(
                                'https://i.postimg.cc/MH1VwDZ8/no-image.jpg'),
                            image: NetworkImage(image),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 10, left: 10, right: 10),
                      child: Text(description, textAlign: TextAlign.justify))
                ],
              )),
        ],
      ),
    );
  }

  Widget _createLogo() {
    print("CREA EL LOGO");
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image(
            image: NetworkImage("https://i.postimg.cc/FznyNY2F/AppLogo.png"),
            width: 200),
      ),
    );
  }
}
