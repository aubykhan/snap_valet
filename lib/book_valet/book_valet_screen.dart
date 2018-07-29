import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_valet/book_valet/model.dart';
import 'package:snap_valet/global.dart';

class BookValet extends StatefulWidget {
  BookValet({Key key, this.valet}) : super(key: key);

  final Valet valet;

  @override
  State<StatefulWidget> createState() => BookValetState();
}

class BookValetState extends State<StatefulWidget> {
  var documentReference;

  /// DocumentReference docReference;

  @override
  void initState() {
    super.initState();
    // docReference = documentReference.document("imran");
    documentReference =
        Firestore.instance.collection('valets').document("imran");
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
          stream: documentReference.snapshots(),
          builder: (context, snapshots) {
            if (!snapshots.hasData ||
                snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/images/map.jpg',
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      elevation: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage(
                                'assets/images/imran.jpeg',
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text("${snapshots.data["name"]}",
                                style: Theme.of(context).textTheme.title),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text("${snapshots.data["id"]}",
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        "ETA: ${snapshots.data["timeToReach"]} minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
            //if (!snapshots.hasData) return const Text('Loading...');
//              return Stack(
//                fit: StackFit.expand,
//                children: <Widget>[
//                Image.asset('assets/images/map.jpg',fit:BoxFit.fitWidth,),
//                Card(
//                  child:  Column(
//                      mainAxisSize: MainAxisSize.min,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        CircleAvatar(
//                          backgroundImage:
//                          AssetImage("assets/images/imran.jpeg"),
//                          radius: 60.0,
//                        ),
//                        //       Expanded(
//                        // child:
//                        Container(
////                            height: 10.0,
////                            width: 20.0,
//                          decoration: BoxDecoration(
//                            shape: BoxShape.rectangle,
//                            color: Colors.white,
//                            // border: Border.all(color: Colors.black,width: 1.0)
//                          ),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              Text(
//                                "Name: ${snapshots.data["name"]}",
//                                style: TextStyle(
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.w500,
//                                  color: Colors.black,
//                                ),
//                              ),
//                              Text(
//                                "Id: ${snapshots.data["id"]}",
//                                style: TextStyle(
//                                    fontSize: 20.0,
//                                    fontWeight: FontWeight.w500),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//               ,
//              ],
//              );
          },
        ),
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
          IconButton(
              icon: Icon(Icons.message),
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.valet_track)),
        ],
      ),
    );
  }
}
