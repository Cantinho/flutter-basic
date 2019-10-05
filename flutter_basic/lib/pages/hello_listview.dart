import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelloListView"),
      ),
      body: _body(),
    );
  }

  _body() {
    final List<Image> imgs = [
      _img("assets/images/dog1.png"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.png"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.png"),
    ];

    return ListView.builder(
        itemCount: imgs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return imgs[index];
        });
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
