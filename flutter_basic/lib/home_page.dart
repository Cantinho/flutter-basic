import 'package:flutter/material.dart';

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

  _body(context) {
    return Container(
      child: _buttons(),
    );
  }

  _buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _text(),
        _img(),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("ListView"),
                _button("Page 2"),
                _button("Page 3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("Snack"),
                _button("Dialog"),
                _button("Toast"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _button(String text) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () => _onClickOk(),
    );
  }

  void _onClickOk() {
    print("Button clicked!");
  }

  _img() {
    return Image.asset(
      "assets/images/dog5.png",
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
