import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes=[
    {"note": "must study","image1":"applelogo.png"},
    {"note": "must study","image2":"applelogo.png"},
    {"note": "must study","image3":"applelogo.png"},
    {"note": "must study","image4":"applelogo.png"},
    {"note": "must study","image5":"applelogo.png"},

  ];
   getUser(){
     var user = FirebaseAuth.instance.currentUser;
     print(user!.email);
   }
   void initstate(){
     getUser();
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed("login");
          }, icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.subdirectory_arrow_right  ),
        onPressed: (){
          Navigator.of(context).pushNamed("Add Notes");
        },

      ),
      body: Container(
        child: ListView.builder(
          itemCount: notes.length,
            itemBuilder: (context,i)
            {
              return Dismissible(key: Key("$i"),
                  child: ListNotes(
                  a:notes[i]
              ));

            }
      ),
      ),
    );
  }
}


class ListNotes extends StatelessWidget {
  final a;
  ListNotes({
    this.a
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex:1,
              child: Image.asset("Images/applelogo.png",
              fit: BoxFit.fill,)),
                Expanded(
                  flex: 4, //bi ys8r 7agm el swar kolha m3 b3d
                    child: ListTile(
                      title: Text("Title"),
                     subtitle: Text("${a["note"]}"),
                     /*subtitle: RaisedButton(
                       onPressed: (){
                       },child: Text("Remove"),),*/
                     trailing: IconButton(
                       icon: Icon(Icons.edit),
                       onPressed: (){

                       },
                     ),
    )),
        ],
      ),
    );
  }
}
