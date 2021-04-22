import 'dart:convert';

import 'package:flutter/material.dart';
import './services.dart' as albumSvc;


List<Album> albumFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}


/*List<Album> albumFromJson(String str) =>
    List<Album>.from(
        jsonDecode(str).map((x) => Album.fromJson(x)));*/

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

class AlbumScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AlbumScreenState();

}

class _AlbumScreenState extends State<AlbumScreen> {
  late List<Album> albumList;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    albumSvc.fetchAlbum().then((value) {
      setState(() => {
        albumList = value,
        isLoaded = true
      });
    });
  }

  void deleteAlbumByIndex( int index) {
    if (isLoaded) {
      setState(() {
        albumList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: isLoaded == false ?
      Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (context, index) {
          var album = albumList.elementAt(index);
          return ListTile(
              title: Text(album.title),
              contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
              trailing: Icon(
                Icons.delete_outline,
              ),
              onTap: () {
                albumSvc.deleteAlbum(album.id.toString()).then((success) => {
                  deleteAlbumByIndex(index)
                });
              }
          );
        },
      )
    );
  }
}


/*StatelessWidget*/
/*import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import './services.dart' as albumSvc;

List<Album> albumFromJson(String str) =>
    List<Album>.from(
        jsonDecode(str).map((x) => Album.fromJson(x)));

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
class AlbumScreen extends StatelessWidget {
  late Future<List<Album>> futureAlbum;
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    futureAlbum = albumSvc.fetchAlbum();
    futureAlbum.then((value) => {
      albumList = value
    });
    final List<Album> mockAlbum = [
      Album(userId: 1, id: 1, title: 'title 1 mock data eaf'),
      Album(userId: 1, id: 2, title: 'title 2 mock data eaf')
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          initialData: mockAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return
                ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var album = snapshot.data!.elementAt(index);
                    return ListTile(
                        title: Text(album.title),
                        contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
                        trailing: Icon(
                          Icons.delete_outline,
                        ),
                        onTap: () {
                          albumSvc.deleteAlbum(album.id.toString());
                        }
                    );
                  },
                );

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
}*/
