
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget{
  @override
  _PaymentPageState createState() => new _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 72.0),
                          child: SizedBox(
                            width: 200.0,
                            height: 40.0,
                            child: FlatButton(
                              color: Theme.of(context).primaryColor,
                              shape: Border(),
                              child: Text('Imran'),
                              onPressed: () => {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 84.0),
                          child: CircleAvatar(
                            radius: 70.0,
                            backgroundImage: AssetImage('assets/images/imran.jpeg'),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Rate me'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star_half),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}