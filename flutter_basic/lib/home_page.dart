import 'package:flutter/material.dart';
import 'package:flutter_basic/drawer_list.dart';
import 'package:flutter_basic/pages/hello_listview.dart';
import 'package:flutter_basic/pages/hello_page2.dart';
import 'package:flutter_basic/pages/hello_page3.dart';
import 'package:flutter_basic/utils/nav.dart';
import 'package:flutter_basic/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.redAccent,
//        child: Icon(Icons.add),
//        onPressed: () {
//          _onClickFab();
//        },
//      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.add),
            onPressed: () {
              _onClickFab();
            },
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.favorite),
            onPressed: () {
              _onClickFab();
            },
          )
        ],
      ),
      drawer: DrawerList(),
    );
  }

  _onClickFab() {
    print("Add");
  }

  _body(BuildContext context) {
    // Padding can be used instead of Container.
    return Container(
      margin: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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

  _onClickToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos is only used for iOS.
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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
