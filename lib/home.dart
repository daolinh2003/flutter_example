import 'package:flutter/material.dart';
import 'package:myapp/welcome/welcome.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Flutter example'),),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: DrawerHeader(
                child: CircleAvatar(),
              )
            ),
            Container(
              color: Colors.blueAccent[200],
              child: Column(
                children: [
                  ListTile(
                    title: Text('Welcome'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.of(context).pushNamed('/welcome', arguments: ScreenArgs('hihi', 'haha'));
                    },
                    hoverColor: Colors.greenAccent,
                    selectedTileColor: Colors.greenAccent,
                  ),
                  ListTile(
                    title: Text('Todo'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.of(context).pushNamed('/todo');
                    },
                    hoverColor: Colors.greenAccent,
                    selectedTileColor: Colors.greenAccent,
                  ),

                  ListTile(
                    title: Text('Album'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.of(context).pushNamed('/album');
                    },
                    hoverColor: Colors.greenAccent,
                    selectedTileColor: Colors.greenAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
