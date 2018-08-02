import 'dart:async';
import 'dart:io';

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
  String etaText = "";

  /// DocumentReference docReference;

  @override
  void initState() {
    super.initState();
    // docReference = documentReference.document("imran");
    documentReference =
        Firestore.instance.collection('valets').document("imran");
    etaText = "  ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Track"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
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
                      width: 300.0,
                      height: 140.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  "Your car is now parked, press Get car back at any time for valet to drive your car back to you",
                                  style: Theme.of(context).textTheme.title),
                              SizedBox(
                                height: 4.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        etaText,
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
          icon: const Icon(Icons.get_app),
          label: new Text("Get car back"),
          onPressed: () {
            _getETA();
            Navigator.of(context).pushNamed(Routes.qr_scan);
          },
        ));
  }

  void _getETA() {
    documentReference.get().then((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          etaText = "ETA: "+ dataSnapshot.data['timeToReach'] +"minutes";
        });
      } else {
        etaText = "loading...";
      }
    });
  }
  //return "ETA: 3 Minutes";
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
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.qr_scan);
            }),
      ],
    ),
  );
}
