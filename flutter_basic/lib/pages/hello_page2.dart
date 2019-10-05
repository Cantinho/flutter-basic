import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/blue_button.dart';

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

  _body(context) {
    return Center(
      child: BlueButton(
        "Back",
        onPressed: () => _onClickBack(context),
        color: Colors.red,
      ),
    );
  }

  _onClickBack(context) {
    Navigator.pop(context, "Screen 2");
  }
}
