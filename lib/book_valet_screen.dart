import 'package:flutter/material.dart';

class BookValet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookValetState();
}

class BookValetState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/map.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/imran.jpeg"),
                radius: 20.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Name: Imran",
                    ),
                    Text("Id: 0123456789")
                  ],
                ),
              ),
              Center(
                child: new ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.call), onPressed: () => {}),
                    new IconButton(icon: Icon(Icons.message), onPressed: () => {}),
                  ],
                ),
              )
            ],
          ),
        ) /* add child content content here */,
      ),
    );
  }
}
