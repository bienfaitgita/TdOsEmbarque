import 'package:exo/data/DataProvider.dart';
import 'package:exo/ui/profil.dart';
import 'package:exo/ui/signUp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrlUsername = new TextEditingController();
  final ctrlPassword = new TextEditingController();
  bool obscurPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          loginHeader(),
          Container(
            padding: EdgeInsets.all(35),
            child: TextFormField(
                // obscureText: isObscur == null ? false : true,
                keyboardType: TextInputType.text,
                // enabled: enabled == null ? true : enabled,
                controller: ctrlUsername,
                decoration: InputDecoration(hintText: "Nom d'utilisateur"
                    // border: InputBorder.none,
                    )),
          ),
          Container(
            padding: EdgeInsets.all(35),
            child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                // enabled: enabled == null ? true : enabled,
                controller: ctrlPassword,
                decoration: InputDecoration(hintText: "Mot de passe"
                    // border: InputBorder.none,
                    )),
          ),
          SizedBox(
            height: 30.0,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          RaisedButton(
            padding: EdgeInsets.all(12.0),
            // shape: StadiumBorder(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "CONNEXION",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            color: Colors.blue,
            onPressed: () {
              DataApiProvider api = new DataApiProvider();
              api
                  .getClientlogin(
                      password: ctrlPassword.text, username: ctrlUsername.text)
                  .then((value) {
                if (value != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProfilPage(client: value)));
                }
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            padding: EdgeInsets.all(12.0),
            // shape: StadiumBorder(),

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "ENREGISTREMENT",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            color: Colors.grey,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SignUp()));
            },
          ),
          //   ],
          // ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    )));
  }

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 128.0,
            width: 128.0,
            child: new CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              radius: 100.0,
              child: new Text(
                "",
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              shape: BoxShape.circle,
              //image: DecorationImage(image: this.logo)
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "SYSTEME EMBARQUE",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.red, fontSize: 20),
          ),
          SizedBox(
            height: 5.0,
          ),
          // Text(
          //   "Sign in to continue",
          //   style: TextStyle(color: Colors.grey),
          // ),
        ],
      );
}
