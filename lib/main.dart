import 'package:flutter/material.dart';
import 'package:snap_valet/Qr_scan/qr_scan_screen.dart';
import 'package:snap_valet/book_valet/book_valet_screen.dart';
import 'package:snap_valet/book_valet/model.dart';
import 'package:snap_valet/contact_back/contact_back_screen.dart';
import 'package:snap_valet/global.dart';
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
            Routes.qr_scan: (context) => new QrScanPage()
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

//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  const MyApp();
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Candidate Names',
//      home: const MyHomePage(title: 'Candidate Votes'),
////      routes: {
////        Routes.fireStoreOperationsAdd: (context) => new UserInfo(),
////        Routes.fireStoreOperationsSub:(context)=>new DeleteUserInfo(),
////        Routes.fireStoreOperationsUpdate:(context)=>new UpdateUserInfo(),
////      },
//    );
//  }
//}

//class MyHomePage extends StatelessWidget {
//  const MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  Widget build(BuildContext context) {
//    return  Scaffold(
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//      bottomNavigationBar: getBottomAppBar(context),
//      appBar:  AppBar(title: new Text(title)),
//      body:  StreamBuilder(
//          stream: Firestore.instance.collection('valets').snapshots(),
//          builder: (context, snapshot) {
//            if (!snapshot.hasData) return const Text('Loading...');
//            return  ListView.builder(
//              itemCount: snapshot.data.documents.length,
//              padding: const EdgeInsets.only(top: 10.0),
//              itemExtent: 55.0,
//              itemBuilder: (context, index) =>
//                  _buildListItem(context, snapshot.data.documents[index]),
//            );
//          }),floatingActionButton: FloatingActionButton.extended(
//        elevation: 4.0,
//        icon: const Icon(Icons.details),
//        label: new Text("Hello"),
//
//        onPressed: () =>{}
//    ),
//    );
//  }
//
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
//    return  ListTile(
//      key:  ValueKey(document.documentID),
//      title:  Container(
//        decoration:  BoxDecoration(
//          border:  Border.all(color: const Color(0x80000000)),
//          borderRadius:  BorderRadius.circular(5.0),
//        ),
//        padding: const EdgeInsets.all(10.0),
//        child:  Row(
//          children: <Widget>[
//            Expanded(
//              child:  Text(document['name']),
//            ),
//            Text(
//              document['votes'].toString(),
//            ),
//          ],
//        ),
//      ),
//      onTap: () => Firestore.instance.runTransaction((transaction) async {
//        DocumentSnapshot freshSnap =
//        await transaction.get(document.reference);
//        await transaction.update(
//            freshSnap.reference, {'votes': freshSnap['votes'] + 1});
//      }),
//    );
//  }
//
////
////  BottomAppBar getBottomAppBar(BuildContext context)
////  {
////    return BottomAppBar(
////      hasNotch: true,
////      child: Row(
////        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////        children: <Widget>[
////          new IconButton(icon: Icon(Icons.add), onPressed: ()=> Navigator.of(context).pushNamed(Routes.fireStoreOperations))
////        ],
////      ),
////    );
////  }
//
//  BottomAppBar getBottomAppBar(BuildContext context)
//  {
//    return BottomAppBar(
//      hasNotch: false,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
////          IconButton(icon: Icon(Icons.add),onPressed: ()=> Navigator.of(context).pushNamed(Routes.fireStoreOperationsAdd),),
////          IconButton(icon: Icon(Icons.remove),onPressed: ()=>Navigator.of(context).pushNamed(Routes.fireStoreOperationsSub)),
////          IconButton(icon: Icon(Icons.update),onPressed: ()=>Navigator.of(context).pushNamed(Routes.fireStoreOperationsUpdate))
//
//        ],
//      ),
//    );
//  }
//
//}
