import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getNavigationDrawer(BuildContext context) {
  return ListView(
// Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader(
// <-- SEE HERE
        decoration: BoxDecoration(color: const Color(0xff764abc)),
        accountName: Text(
          'Notary Public',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        accountEmail: Text(
          'Android Studio',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),

        currentAccountPicture: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(50.0)),
              border: Border.all(color: Colors.white),
            ),
            child: new Image.asset('assets/icon_notary.png')),
      ),
      ListTile(
        leading: Icon(
          Icons.home,
        ),
        title: const Text('Page 1'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(
          Icons.train,
        ),
        title: const Text('Page 2'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}
