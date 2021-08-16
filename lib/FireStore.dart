import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firestortest extends StatefulWidget {
  const Firestortest({Key? key}) : super(key: key);

  @override
  _FirestortestState createState() => _FirestortestState();
}

class _FirestortestState extends State<Firestortest> {
  CollectionReference usersref =FirebaseFirestore.instance.collection("users");
  List users=[];
  getData() async {
    var respond = await usersref.get();
    respond.docs.forEach((element) { setState(() {
      users.add(element.data());
    });});
    print("==========================");
    print(users);
  }
    /*CollectionReference usersref=FirebaseFirestore.instance.collection("users");
    // users dah el path beta3 el firestore
   QuerySnapshot querySnapshot= await usersref.get();
   */ /*List<QueryDocumentSnapshot> Listdocs= querySnapshot.docs;
   Listdocs.forEach((element) {
        print(element.data());
        print("===========================");
   });
*/ /*
    await usersref.get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        print("==================");
      });
    });*/
    //-------------------call data from firestore
    /*FirebaseFirestore.instance
        .collection('users')
        //.where("username", isEqualTo: "enas")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    });
  }*/
//----------------add data in firestore--------------------
  /*AddData() async {
    FirebaseFirestore.instance.collection("users").
        doc("123456789").set({
      "username":"wafaa","age":55,"email":"wafaa62.adly@gmail.com"
    });
    *//*add(
      {"username": "Mohamed", "age": 35, "email": "moe123@gmail.com"},
    );*//*
  }
*/
  void initstate() {
    getData();
    super.initState();
  }

  /*void initstate2() {
    AddData();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: /*ListView.builder(
            itemCount: users.length,
            itemBuilder:(context,i)
        {
          return ListTile(
            title: Text("username:${users[i]['username']}"),
            subtitle: Text("phone:${users[i]['phone']}"),
          );
        })*/
      Column(
        children: [

          Center(
            child: RaisedButton(
              child: Text("click"),
              onPressed: () async {
                var resp = await getData();
                print(resp);
              },
            ),
          ),
          /*Center(
            child: RaisedButton(
              child: Text("Add data in firestore"),
              onPressed: () async {
                var result = await AddData();
                print(result);
              },
            ),*/
         //)
          RaisedButton(
            child: Text("go to storage"),
              onPressed: (){
            Navigator.of(context).pushNamed("Storage");
          })
        ],
      ),

    );
  }
}

