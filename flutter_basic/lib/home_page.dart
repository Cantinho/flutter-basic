import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/hello_listview.dart';
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
          _buttons(),
        ],
      ),
    );
  }

  _bodyExpanded(BuildContext context) {
    // Padding can be used instead of Container.
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: _pageView(),
        ),
        Expanded(
          flex: 3,
          child: _pageView(),
        )
      ],
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnake(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: () => _onClickToast(context)),
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickSnake(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Hello SnackBar!"),
        action: SnackBarAction(
          textColor: Colors.redAccent,
          label: "OK",
          onPressed: () {
            print("OK Snack!");
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrier dismissible evicts dialog closes screen outside.
      barrierDismissible: false,
      builder: (context) {
        // WillPopScope instead of AlertDialog prevents
        // alert dialog closes while pushs screen back button.
        return WillPopScope(

          // Remove onWillPop if using Alert Dialog.
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter Alert Dialog is cool!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  print("cancel dialog");
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  print("ok dialog");
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast(BuildContext context) {}

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
