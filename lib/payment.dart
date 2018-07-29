import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => new _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showConfirmationMessage(),
        icon: Icon(Icons.payment),
        label: Text('Confirm payment'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
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
                      Text("Imran", style: Theme.of(context).textTheme.title),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text("Rate me",
                          style: Theme.of(context).textTheme.caption),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star_half),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                            Icon(Icons.star_border),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 8.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text('Rs. 250'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Payment method',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    RadioListTile(
                      title: Text('Cash'),
                      onChanged: (bool t) => {},
                    ),
                    RadioListTile(
                      title: Text('Easy paisa'),
                      onChanged: (bool t) => {},
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _showConfirmationMessage() async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
            title: Text('Payment successful'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              )
            ],
          ),
    );
  }
}
