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
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/images/map.jpg',
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      child: Card(
                      // shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40.0)),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/imran.jpeg',),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        "ETA: ${snapshots.data["timeToReach"]} minutes",
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
          IconButton(icon: Icon(Icons.message), onPressed: ()=>Navigator.of(context).pushNamed(Routes.qr_image)),
        ],
      ),
    );
  }
}
