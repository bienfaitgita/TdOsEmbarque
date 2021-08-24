import 'package:exo/models/client.dart';
import 'package:exo/ui/myWidgets.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  final Client client;
  ProfilPage({@required this.client});
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final ctrlNom = new TextEditingController();
  final ctrlPostnom = new TextEditingController();
  final ctrlPrenom = new TextEditingController();
  final ctrlContact = new TextEditingController();
  final ctrlMail = new TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrlNom.text = widget.client.nom;
    ctrlPostnom.text = widget.client.postnom;
    ctrlPrenom.text = widget.client.prenom;
    ctrlContact.text = widget.client.contact;
    ctrlMail.text = widget.client.mail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fiche"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                    // obscureText: true,
                    keyboardType: TextInputType.text,
                    enabled: false,
                    controller: ctrlNom,
                    decoration: InputDecoration(hintText: 'Nom'
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
                    enabled: false,
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
            ],
          ),
        ),
      ),
    );
  }
}
