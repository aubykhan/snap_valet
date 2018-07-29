import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_valet/book_valet/model.dart';
import 'package:snap_valet/global.dart';

class GetCarBack extends StatefulWidget {
  GetCarBack({Key key, this.valet}) : super(key: key);

  final Valet valet;

  @override
  State<StatefulWidget> createState() => GetCarBackState();
}

class GetCarBackState extends State<StatefulWidget> {
  var documentReference;
  /// DocumentReference docReference;

  @override
  void initState() {
    super.initState();
    // docReference = documentReference.document("imran");
    documentReference = Firestore.instance.collection('valets').document("imran");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Track"),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:()=> Navigator.of(context).pop()),
        ),
        bottomNavigationBar: getBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: StreamBuilder(
            stream: documentReference.snapshots(),
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
                                "Name: ${snapshots.data["name"]}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Id: ${snapshots.data["id"]}",
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
                                  "ETA: ${snapshots.data["timeToReach"]} minutes",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ) /* add child content content here */,
                ),
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.get_app),
          label: new Text("Get car back"),
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
          IconButton(icon: Icon(Icons.message), onPressed: () => Navigator.of(context).pushNamed(Routes.valet_track)),
        ],
      ),
    );
  }
}
