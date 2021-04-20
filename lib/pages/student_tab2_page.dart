
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/services/authentication.dart';

class StudentBasicSecPage extends StatefulWidget{

  StudentBasicSecPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _StudentBasicSecPageState();
}

class _StudentBasicSecPageState extends State<StudentBasicSecPage>{
  @override
  Widget build(BuildContext context) {

  }

}