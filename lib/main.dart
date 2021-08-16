import 'package:designapp/AowsemDialog.dart';
import 'package:designapp/FirbaseStorage.dart';
import 'package:designapp/FireStore.dart';
import 'package:designapp/Grid/addnotes.dart';
import 'package:designapp/HomePage.dart';
import 'package:designapp/auth/Login.dart';
import 'package:designapp/auth/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //b3rf el firebase 3ndy fi el app
  //3shan yt2kd mn 3amliat
  // el initialize w el rabt abl ma el app y3ml run

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: Login(),
      routes: {
       "signup":(context)=>Signup(),
        "Homepage":(context)=>HomePage(),
        "Add Notes":(context)=>AddNotes(),
        "alert dialog":(context)=>AlertDialoge(),
        "login":(context)=>Login(),
        "firestore":(context)=>Firestortest(),
        "Storage":(context)=>FirebaseStorage(),
      },
    );
  }
}



