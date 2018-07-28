import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_valet/book_valet/model.dart';

class BookValet extends StatefulWidget {
  BookValet({Key key, this.valet}) : super(key: key);

  final Valet valet;

  @override
  State<StatefulWidget> createState() => BookValetState();
}

class BookValetState extends State<StatefulWidget> {
  var documentReference = Firestore.instance.collection('valets');
  DocumentReference docReference;

  @override
  void initState() {
    super.initState();
    docReference = documentReference.document("valets/imran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Find a valet"),
        ),
        body: StreamBuilder(
            stream: docReference.snapshots(),
            builder: (context, snapshots) {
             // if (!snapshots.hasData) return const Text('Loading...');
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/imran.jpeg"),
                          radius: 60.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Name: Imran",
                              ),
                              Text("Id: 0123456789")
                            ],
                          ),
                        ),
                        Center(
                          child: ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.call),iconSize: 40.0, onPressed: () => {}),
                              IconButton(
                                  icon: Icon(Icons.message),iconSize: 40.0, onPressed: () => {}),
                            ],
                          ),
                        )
                      ],
                    ),
                  ) /* add child content content here */,
                ),
              );
            }));
  }
}
