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
    docReference = documentReference.document("imran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Find a valet"),
        ),
        bottomNavigationBar: getBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: StreamBuilder(
            stream: docReference.snapshots(),
            builder: (context, snapshots) {
              //if (!snapshots.hasData) return const Text('Loading...');
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
                          backgroundImage:
                              AssetImage("assets/images/imran.jpeg"),
                          radius: 60.0,
                        ),
                        //       Expanded(
                        // child:
                        Container(
//                            height: 10.0,
//                            width: 20.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            // border: Border.all(color: Colors.black,width: 1.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Name: imran",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Id: 0123456789",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        //   ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "ETA: 3 minutes",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),

//                        Center(
//                          child: ButtonBar(
//                            mainAxisSize: MainAxisSize.max,
//                            alignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              IconButton(
//                                  icon: Icon(Icons.call),iconSize: 40.0, onPressed: () => {}),
//                              IconButton(
//                                  icon: Icon(Icons.message),iconSize: 40.0, onPressed: () => {}),
//                            ],
//                          ),
//                        )
                      ],
                    ),
                  ) /* add child content content here */,
                ),
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.cancel),
          label: new Text("Cancel"),
        ));
  }

  BottomAppBar getBottomAppBar(BuildContext context) {
    return BottomAppBar(
      hasNotch: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () => print("c"),
          ),
          IconButton(icon: Icon(Icons.message), onPressed: () => print("m")),
        ],
      ),
    );
  }
}
