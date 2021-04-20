import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";



import 'package:miniproject/services/authentication.dart';

import 'student_tab1_page.dart';
import 'student_tab2_page.dart';


class StudentHomePage extends StatefulWidget {
  StudentHomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.qr_code_scanner),
                  text: "Scan Qr",
                ),
                Tab(icon: Icon(Icons.account_box_outlined), text: "Profile"),
              ],
            ),
            title: Text(
              ' Welcome Student',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.indigo,
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  onPressed: signOut),
            ],
          ),
          body: TabBarView(
            children: [
              StudentBasicPage(),
              StudentBasicSecPage(),
            ],
          ),
        ),
      ),
    );
  }


}
