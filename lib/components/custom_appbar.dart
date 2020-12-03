import 'package:flutter/material.dart';
import '../constants.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(String title, context)
      : super(
    elevation: 0.0,
    backgroundColor: BasePalette.accent,
    flexibleSpace: _buildCustomAppBar(title),
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    actions: [
      IconButton(
        icon:Icon(
          Icons.logout,
          color: BasePalette.accent,
        ),
        onPressed:() async {
          bool result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Konfirmasi'),
                content: Text('Yakin ingin keluar?'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(false); // dismisses only the dialog and returns false
                    },
                    child: Text('Tidak', style: TextStyle(color: BasePalette.primary)),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(true); // dismisses only the dialog and returns true
                    },
                    child: Text('Iya' , style: TextStyle(color: BasePalette.primary)),
                  ),
                ],
              );
            },
          );
          if(result){
//            SharedPreferences prefs = await SharedPreferences.getInstance();
//            prefs.clear();
//            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
//              return new IntroScreen();
//            }));
          }
        },
      ),
    ],
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
  );

  void _logout() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.clear();
  }

  static Widget _buildCustomAppBar(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0,top: 8.0, bottom: 8),
      margin: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.8, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            "assets/logo.png",
            height: 40.0,
            width: 60.0,
          ),
          SizedBox(width: 5),
          Text(title, style: TextStyle(color: BasePalette.primary, fontFamily: "NeoSansBold", fontSize:20))
          // new Container(
          //   child: new Row(
          //     children: <Widget>[
          //       new Container(
          //         height: 28.0,
          //         width: 28.0,
          //         padding: EdgeInsets.all(6.0),
          //         decoration: new BoxDecoration(
          //             borderRadius:
          //             new BorderRadius.all(new Radius.circular(100.0)),
          //             color: Colors.orangeAccent),
          //         alignment: Alignment.centerRight,
          //         child: new Icon(
          //           Icons.local_bar,
          //           color: Colors.white,
          //           size: 16.0,
          //         ),
          //       ),
          //       new Container(
          //         padding: EdgeInsets.all(6.0),
          //         decoration: new BoxDecoration(
          //             borderRadius:
          //             new BorderRadius.all(new Radius.circular(5.0)),
          //             color: Color(0x50FFD180)),
          //         child: new Text(
          //           "1.781 poin",
          //           style: TextStyle(fontSize: 14.0),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
