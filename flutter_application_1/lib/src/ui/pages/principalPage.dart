import 'package:flutter_application_1/src/ui/widgets/backgroundPage.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 0.0),
      decoration: BackgroundPage.backgroundPageCreate(),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_createTree(), _button(), _createLogo()],
      )),
    ));
  }

  Widget _createTree() {
    return Image(
        image: NetworkImage('https://i.postimg.cc/dQWm8fLM/arbol.png'),
        width: 290);
  }

  Widget _createLogo() {
    return Image(
        image: NetworkImage("https://i.postimg.cc/FznyNY2F/AppLogo.png"),
        width: 330);
  }

  Widget _button() {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'menuPage'),
        child: Expanded(
          child: Image(
              image: NetworkImage('https://i.postimg.cc/3NwXsXfb/clic.png'),
              fit: BoxFit.cover,
              width: 60,
              height: 60),
        ));
  }
}
