import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:designapp/auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var myusername, myemail, mypassword;
  GlobalKey<FormState> userkey= new GlobalKey<FormState>();
  signUp() async{ // el ta7kok mn el bainat da5lt sa7 wala l2a
   var FormData= userkey.currentState;
   if(FormData!.validate())
     {
       FormData.save();
       try {
         UserCredential userCredential = await FirebaseAuth.instance.
         createUserWithEmailAndPassword(
             email: myemail,
           password: mypassword,
         );
         return userCredential;
       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           AwesomeDialog(context: context,
           title: "Error",
             body: Text("password too week"),
           )..show();
           print('The password provided is too weak.');
         } else if (e.code == 'email-already-in-use') {
           AwesomeDialog(context: context,
             title: "Error",
             body: Text("The account already exists for that email."),
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
          title: Text("Signup"),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(top: 1),

                child: Image.asset("Images/applelogo.png",
                  height: 150,
                  width: 150,

                )),
            Container(
                padding: EdgeInsets.all(20),
                child: Form(
                       key: userkey,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (val){
                            myusername=val;
                },
                          validator: (val){
                            if(val!.length>100)
                              {
                                return "user name can't be larger than 100";
                              }
                            if(val.length<2)
                              {
                                return"user name must be larger than two";
                              }
                          },
                          decoration: InputDecoration(
                              hintText: "username",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                        ),
                        SizedBox(height: 20),
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

                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_rounded),
                              border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1))),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
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
                          keyboardType: TextInputType.number,
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
                              Text("if  have an account"),
                              InkWell(
                                child: Text("Click Here",
                                  style: TextStyle(color: Colors.red),),
                                onTap: (){
                                     Navigator.push(context,
                                         MaterialPageRoute(builder: (context)=>Login()));
                                },

                              )
                            ],
                          ),
                        ),
                        /*Container(
                          child: RaisedButton(

                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Signup",style: TextStyle(fontSize: 20),),
                            onPressed: () async{
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: "anosa.adly59@gmail.com",
                                    password: "Enasfahd176154"
                                );
                                print(userCredential.user!.emailVerified);
                                if(userCredential.user!.emailVerified==false)
                                {
                                  User? user = FirebaseAuth.instance.currentUser;
                                  await user!.sendEmailVerification();
                                }

                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided for that user.');
                                }
                              }



                            },),
                        ),

*/
                        Container(
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Signup",
                              style: TextStyle(fontSize: 20),),
                            onPressed: () async {
                               UserCredential response= await signUp();
                               print("==========================");
                               if(response!=null)
                                 {
                                   Navigator.of(context).pushReplacementNamed("Homepage");
                                 }
                               else {
                                 print("Sign Up Failed");
                               }

                            },),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
