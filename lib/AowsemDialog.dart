import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AlertDialoge extends StatefulWidget {
  const AlertDialoge({Key? key}) : super(key: key);

  @override
  _AlertDialogeState createState() => _AlertDialogeState();
}

class _AlertDialogeState extends State<AlertDialoge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:RaisedButton(onPressed: (){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.QUESTION,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Dialog Title',
              desc: 'Dialog description here.............',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          },
          child: Text("Show Alert"),),
          )
        ],
      )
    );
  }
}
