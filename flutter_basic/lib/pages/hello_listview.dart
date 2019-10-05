import 'package:flutter/material.dart';

class Dog {
  String name;
  String photo;

  Dog(this.name, this.photo);
}

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
    final List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          Dog dog = dogs[index];
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _img(dog.photo),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(
                    dog.name,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
