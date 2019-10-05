import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/hello_listview.dart';

class DogPage extends StatelessWidget {

  final Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: _body(dog.photo),
    );
  }

  _body(String img) {
    return Image.asset(dog.photo);
  }
}
