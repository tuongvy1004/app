//import 'package:app_songngu/login/signup.dart';
//import 'package:app_songngu/main.dart';
// ignore: unused_import
import 'package:app_history/screens/homepage.dart';
import 'package:app_history/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String email = "";
String password = "";
void validation() async {
  final FormState? _form = _formKey.currentState;
  if (!_form!.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user!.uid);
    } on PlatformException catch (e) {}
    
  } 
  
  else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Image.asset('assets/images/login.png'),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlue[50]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Vui l??ng nh???p email!";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.lightBlue,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                              print(email);
                            });
                          },
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlue[50]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          obscureText: obserText,
                          validator: (value) {
                            if (value == "") {
                              return "Vui l??ng nh???p m???t kh???u";
                            } else if (value!.length < 8) {
                              return "M???t kh???u qu?? ng???n";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.lightBlue,
                              ),
                              hintText: 'M???t kh???u',
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    width: 350,
                    child: RawMaterialButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                      fillColor: Colors.lightBlue[300],
                      onPressed: () {
               
                          validation();
                          
                      
                        // if (!_formKey.currentState!.validate()) {
                        //    _formKey.currentState!.save();
                           
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomePage()));
                        // }
                    
                        
                      },
                      child: Text(
                        '????NG NH???P',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    width: 350,
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'B???n ch??a c?? t??i kho???n? ????ng k???',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
