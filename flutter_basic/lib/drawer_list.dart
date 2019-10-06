import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Samirtf"),
            accountEmail: Text("samirtf@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/dog1.png"),
              //Use below to load image through network
              //backgroundImage: NetworkImage("https://avatars1.githubusercontent.com/u/5253073?s=460&v=4"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Favorites"),
            subtitle: Text("more info..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
            subtitle: Text("more info..."),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 2");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 3");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
