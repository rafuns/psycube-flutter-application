import 'package:flutter/material.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/user/user_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
          title: Text(
            'PsyCube',
            style: kHeaderText,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF107dac)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF499CD8), Color(0xFF55C5A6)]),
        ),
        child: Column(
          children: <Widget>[
            /// Zach - add new widgets in here to design the page. please don't delete any logout stuff it took me hours thx
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Log Out'),
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage');
                UserAuth().signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
