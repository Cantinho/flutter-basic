import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/hello_page1.dart';
import 'package:flutter_basic/pages/hello_page2.dart';
import 'package:flutter_basic/pages/hello_page3.dart';
import 'package:flutter_basic/utils/nav.dart';
import 'package:flutter_basic/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello World!",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    // Padding can be used instead of Container.
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("ListView",
                onPressed: () => _onClickNavigator(context, HelloPage1())),
            BlueButton("Page 2",
                onPressed: () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page 3",
                onPressed: () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", onPressed: _onClickSnake),
            BlueButton("Dialog", onPressed: _onClickDialog),
            BlueButton("Toast", onPressed: _onClickToast),
          ],
        ),
      ],
    );
  }

  _onClickSnake() {}

  _onClickDialog() {}

  _onClickToast() {}


  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World!",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}
