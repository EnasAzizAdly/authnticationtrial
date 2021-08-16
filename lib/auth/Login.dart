import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:designapp/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
/*import 'package:google_sign_in/google_sign_in.dart';
import 'package:statsfl/statsfl.dart';*/



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /*Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/
  var  myemail, mypassword;
  GlobalKey<FormState> userkey= new GlobalKey<FormState>();
  signIN()async{
    var FormData= userkey.currentState;
    if(FormData!.validate())
    {
      FormData.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.
        signInWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          AwesomeDialog(context: context,
            title: "Error",
            body: Text("password wrong for that user"),
          )..show();
          print('The password provided is too weak.');
        } else if (e.code == 'user-not-found') {
          AwesomeDialog(context: context,
            title: "Error",
            body: Text("NO user found for that email"),
          )..show();
        }
      } catch (e) {
        print(e);
      }
    }
    else
    {

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(top: 1),
                width: 150,
                child: Image.asset("Images/applelogo.png",
                    height: 150,
                    width: 150
                )),
            Container(
              padding: EdgeInsets.all(20),
                child: Form(
                  key: userkey,
                    child: Column(
              children: [
                TextFormField(
                  onSaved: (val)
                  {
                    myemail=val;
                  },
                  validator: (val) {
                    if (val!.length > 100) {
                      return "Email can't to be larger than 100 letter";
                    }
                    if (val.length < 2) {
                      return "Email can't to be less than 2 letter";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val)
                  {
                    mypassword=val;
                  },
                  validator: (val) {
                    if (val!.length > 100) {
                      return "Password can't to be larger than 100 letter";
                    }
                    if (val.length < 4) {
                      return "Password can't to be less than 4 letter";
                    }
                    return null;
                  },
                  obscureText:true,
                  decoration: InputDecoration(
                      hintText: "password",
                      prefixIcon: Icon(Icons.vpn_key),

                      border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("if you don't have an account"),
                      InkWell(
                        child: Text("Click Here",
                          style: TextStyle(color: Colors.red),),
                        onTap: (){
                            Navigator.of(context).pushNamed("signup");
                        },

                      )
                    ],
                  ),
                ),
                    /*Container(
                     child: RaisedButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Login",style: TextStyle(fontSize: 20),),
                    onPressed: () async{
                      //Navigator.of(context).pushNamed("Homepage");
                      //-----------------Anonmynous-----------
                     *//* UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously(); // tasgeal el d5oal li sha5s maghoal bi ysm3 fi el database bs
                      print(userCredential.user!.uid);*//*
                      // bi ygeab el user id
                      //42zxlFJZl4M4LRc2tiBWnuY6Unx1

                      //----------------email and password------
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: "anosa.adly59@gmail.com",
                            password: "Enasfahd176154",
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }

                      }
                      catch (e) {
                        print(e);
                      }
                    },),
                ),*/
                /*Container(
                  child: RaisedButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Login with google",
                      style: TextStyle(fontSize: 20),),
                    onPressed: () async{
                      UserCredential cred=await signInWithGoogle();
                      print(cred);

                    },),
                ),*/
                Container(
                  child: RaisedButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Login ",
                      style: TextStyle(fontSize: 20),),
                    onPressed: () async{
                      UserCredential user=await signIN();
                      if(user!=null)
                        {
                          Navigator.of(context).pushReplacementNamed("Homepage");
                        }
                       //Navigator.of(context).pushReplacementNamed("Homepage");
                    },),
                ),

                RaisedButton(
                  child: Text("Fire Store"),
                    onPressed: (){
                  Navigator.of(context).pushNamed("firestore");
                })
              ],
            )))
          ],
        ));
  }
}
