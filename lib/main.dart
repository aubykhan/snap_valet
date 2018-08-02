import 'package:flutter/material.dart';
import 'package:snap_valet/Qr_scan/qr_scan_handover.dart';
import 'package:snap_valet/Qr_scan/qr_scan_screen.dart';
import 'package:snap_valet/book_valet/book_valet_screen.dart';
import 'package:snap_valet/book_valet/model.dart';
import 'package:snap_valet/contact_back/contact_back_screen.dart';
import 'package:snap_valet/global.dart';
import 'package:snap_valet/payment.dart';
import 'package:snap_valet/theme.dart';


void main() => runApp(
  new MaterialApp(
      title: "SnapV",
      theme: kSnapVTheme,
      home: HomePage(),
      routes: {
        Routes.valet_info: (context) => new BookValet(),
        Routes.valet_track: (context) =>
        new GetCarBack(valet: Valet(valetID: "imran")),
        Routes.qr_scan:(context)=>new QrScanPage(),
        Routes.qr_image:(context)=>new QrImagePage('', '', 0.0),
        Routes.payment:(context)=>new PaymentPage(),
        Routes.home:(context)=>new HomePage()
      }),
); // comment check


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/map.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(64.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      trailing: const Icon(Icons.search),
                      title: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search a location',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.person),
        label: const Text('Request a valet'),
        onPressed: () => Navigator.pushNamed(context, Routes.valet_info),
      ),
    );
  }
}
