import 'package:flutter/material.dart';
import 'package:latihan_dkk1/components/custom_appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => new _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String name ="";
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          //drawer: CustomDrawer(),
          backgroundColor: Colors.white,
          appBar: CustomAppBar("YOURFIT POLARISM", context),
          body: Text(name),//_body(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: new FloatingActionButton(
            //onPressed: messageAdmin,
            backgroundColor: Colors.green,
            tooltip: 'Telphone Admin',
            child: new Icon(Icons.call),
          ),

        )
    );
  }
}