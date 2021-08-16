import 'package:designapp/AowsemDialog.dart';
import 'package:flutter/material.dart';
class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(child:
      Column(
        children: [

          Form(child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "add note",
                  prefixIcon: Icon(Icons.notes),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "add note",
                  prefixIcon: Icon(Icons.notes),
                ),
              ),
              RaisedButton(
                child: Text("Alert Dialog"),
                  onPressed: (){
                 Navigator.of(context).pushNamed("alert dialog");
              })
            ],
          ))
        ],
      )),
    );
  }
}
