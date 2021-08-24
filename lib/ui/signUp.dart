import 'dart:io';

import 'package:exo/data/DataProvider.dart';
import 'package:exo/models/client.dart';
import 'package:exo/models/result.dart';
import 'package:exo/ui/login.dart';
import 'package:exo/ui/myWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ctrlNom = new TextEditingController();
  final ctrlPostnom = new TextEditingController();
  final ctrlPrenom = new TextEditingController();
  final ctrlAdresse = new TextEditingController();
  final ctrlContact = new TextEditingController();
  final ctrlMail = new TextEditingController();
  final ctrlUsername = new TextEditingController();
  final ctrlPassword = new TextEditingController();
  String sexe;
  bool isAsync = false;
  List<DropdownMenuItem<String>> sexes = [
    DropdownMenuItem(
      value: "M",
      child: Text("M"),
    ),
    DropdownMenuItem(
      value: "F",
      child: Text("F"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ENREGISTREMENT"),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        body: ModalProgressHUD(
          inAsyncCall: isAsync,
          progressIndicator: SpinKitCircle(
            color: Colors.red,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlNom,
                        decoration: InputDecoration(
                          hintText: 'Nom',
                          // border: InputBorder.none,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlPostnom,
                        decoration: InputDecoration(hintText: 'Postnom'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlPrenom,
                        decoration: InputDecoration(hintText: 'Prenom'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlAdresse,
                        decoration: InputDecoration(hintText: 'Adresse'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: DropdownButton(
                        value: sexe,
                        isExpanded: true,
                        // underline: Container(
                        //   color: Colors.white,
                        // ),
                        hint: Text("Sexe"),
                        items: sexes,
                        onChanged: (value) {
                          setState(() {
                            sexe = value;
                          });
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlContact,
                        decoration: InputDecoration(hintText: 'Contact'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlMail,
                        decoration: InputDecoration(hintText: 'Mail'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        // obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlUsername,
                        decoration: InputDecoration(hintText: 'Username'
                            // border: InputBorder.none,
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        // enabled: enabled == null ? true : enabled,
                        controller: ctrlPassword,
                        decoration: InputDecoration(hintText: 'Mot de passe'
                            // border: InputBorder.none,
                            )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    // shape: StadiumBorder(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "ENREGISTRER",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.blue,
                    onPressed: () async {
                      setState(() {
                        isAsync = true;
                      });
                      Client client = new Client();
                      client.nom = ctrlNom.text;
                      client.postnom = ctrlPostnom.text;
                      client.prenom = ctrlPrenom.text;
                      client.sexe = sexe;
                      client.adresse = ctrlAdresse.text;
                      client.contact = ctrlContact.text;
                      client.mail = ctrlMail.text;
                      client.username = ctrlUsername.text;
                      client.password = ctrlPassword.text;
                      final api = DataApiProvider();
                      await api.saveClient(client: client).then((value) {
                        if (value.status) {
                          setState(() {
                            isAsync = false;
                          });
                          Fluttertoast.showToast(msg: 'Saved succefully');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (ctx) => LoginPage()),
                              (route) => false);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
