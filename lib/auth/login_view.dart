import 'package:flutter/material.dart';
import 'package:latihan_dkk1/menu/menu_view.dart';
import '../constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      backgroundColor: Color(0xffffffff),
      body: new SingleChildScrollView(
          child:
          Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.white, Colors.purple],
                  //colors: [BasePalette.primary, BasePalette.primary  ],
                  stops: [0, 1],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/bg2.png") ,
                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.2),
                      BlendMode.dstATop),
                  fit: BoxFit.cover,
                  //alignment: FractionalOffset.topCenter,
                ),
              ),
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 20),
                  new Image.asset(
                    "assets/logo.png",
                    height: 200,
                    width: 200.0,
                  ),
                  Text("APLIKASI UJI COBA", style: TextStyle(fontSize: 20, color: BasePalette.primary)),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("LOGIN", style: TextStyle( fontSize: 16, color: BasePalette.primary)),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    color: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: 10),
                        _entryField("Username", false, "Username"),
                        _entryField("Password", true, "Password"),
                        _submitButton(),
                      ],
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  Widget _entryField(String title, bool isPassword, String hint) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   title,
          //   style: TextStyle(fontSize: 14, color: Color(0xffffffff)),
          // ),
          SizedBox(
            height: 10,
          ),
          new Theme(
              data: new ThemeData(
                primaryColor: BasePalette.accent,
              ),
              child: TextField(
                  controller: title=="Password"?passwordController:emailController,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      prefixIcon: title=="Password"?Icon(Icons.vpn_key):Icon(Icons.email),
                      hintText: hint,
                      // contentPadding: new EdgeInsets.symmetric(vertical: -10, horizontal: 15),
                      // border: new OutlineInputBorder(
                      //   borderRadius: const BorderRadius.all(
                      //     const Radius.circular(20.0),
                      //   ),
                      //   borderSide: const BorderSide(color: Colors.indigo, width: 0.0),
                      // ),
                      filled: true)
              )
          )
        ],
      ),
    );
  }
  Widget _submitButton() {
    return new GestureDetector(
        onTap: (){
          login();
        },
        child:
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical:30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //       color: Colors.grey.shade400,
                //       offset: Offset(2, 4),
                //       blurRadius: 5,
                //       spreadRadius: 2)
                // ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [BasePalette.primary, BasePalette.primary, BasePalette.accent ])),
            child:
            Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
        )
    );
  }

  login() async {
    Fluttertoast.showToast(msg: "BERHASIL", toastLength: Toast.LENGTH_SHORT);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', emailController.text);
    await prefs.setString('password', passwordController.text);
    print(prefs.getString("username"));
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
         return new MenuPage();
       }));
  }
}