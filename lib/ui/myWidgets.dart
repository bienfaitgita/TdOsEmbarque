import 'package:flutter/material.dart';

Widget cmbTypeOperation({String textHint, @required Widget child}) =>
    /* Expanded(
      child:  */
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            textHint,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          height: 50.0,
          margin: EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey[500], width: 1),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(child: child),
        )
      ],
    );

Widget textField(
    {String textHint,
    TextEditingController controller,
    bool enabled,
    bool isNumber,
    bool isObscur}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(textHint),
      ),
      Container(
        height: 50.0,
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey[500], width: 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: TextFormField(
              obscureText: isObscur == null ? false : true,
              keyboardType:
                  isNumber == null ? TextInputType.text : TextInputType.number,
              enabled: enabled == null ? true : enabled,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
              )),
        ),
      )
    ],
  );
}
