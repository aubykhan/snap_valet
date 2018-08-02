import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:snap_valet/global.dart';

class QrImagePage extends StatefulWidget {
  QrImagePage(this._name, this._id, this._amount);
  final double _amount;
  final String _name;
  final String _id;
  //final QrApi api = new QrApi(httpDataSource, authenticator.sessionToken);

  @override
  State createState() => new QrImagePageState(_name, _id, _amount);
}

class QrImagePageState extends State<QrImagePage> {
  QrImagePageState(this._name, this._id, this._amount);
  String _name;
  String _id;
  double _amount;
  bool _isLoading = false;

  final _biggerFont =
  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  final _smallerFont = const TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );
  Uint8List _imageBytes;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    try {
      _isLoading = true;
      var bytes = await generateQr("200", _name,"200.00");
      setState(() {
        _imageBytes = bytes;
      });
    } finally {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Handover Car"),
      ),
      bottomNavigationBar: getBottomAppBar(context),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Card(
          color: Colors.white,
          child: new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//                new Text(
//                  'PKR ${200.00}',
//                  style: _biggerFont,
//                  textAlign: TextAlign.center,
//                ),
                new Padding(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Container(
                  width: 210.0,
                  height: 210.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage('assets/images/img_qr_border.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: _isLoading
                      ? new Center(
                    child: new CircularProgressIndicator(),
                    heightFactor: 50.0,
                    widthFactor: 50.0,
                  )
                      : _imageBytes != null
                      ? new Image.memory(_imageBytes)
                      : new Container(
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(16.0),
                ),
                new Text(
                  "Snap Valet",
                  style: _smallerFont,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
          IconButton(icon: Icon(Icons.forward), onPressed: ()=>Navigator.of(context).pushNamed(Routes.valet_track)),
        ],
      ),
    );
  }

  Future<Uint8List> generateQr(String dim, String name, String amount) async {

      //Mock Data
      return base64.decode(
          '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');

  }
}
