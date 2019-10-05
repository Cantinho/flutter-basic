import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: RaisedButton(
          color: Colors.blue,
          child: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _onClickVoltar(context)),
    );
  }

  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Screen 2");
  }
}
