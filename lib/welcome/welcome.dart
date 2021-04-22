import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScreenArgs args = ModalRoute.of(context)!.settings.arguments as ScreenArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text('welcome')
//        backgroundColor: Colors.blue[200],
      ),
      body: Center(
//        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2)
          child: Column(
            children: [
              Text('Welcome ${args.firstName} ${args.lastName}!', style: Theme.of(context).textTheme.headline2),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TextButton(
                  child: Text('Back to previous'),
                  onPressed: () => Navigator.pop(context, 'Back from welcome screen'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TextButton(
                  child: Text('Go to Todo list'),
                  onPressed: () => Navigator.of(context).pushNamed('/todo'),
                ),
              )
            ],
          )

      ),
    );
  }
}

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArgs {
  final String firstName;
  final String lastName;

  ScreenArgs(this.firstName, this.lastName);
}


/*import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
  await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  late Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    futureAlbum = fetchAlbum();

    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      );

  }
}

*/
