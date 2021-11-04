//import 'package:app_songngu/login/login.dart';
import 'package:app_history/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// RegExp regExp = new RegExp(p);


bool obserText = true;
String email = "";
String password = "";
//late final Function onChanged;

class _SignUpState extends State<SignUp> {
//   void validation() {
//   final FormState? _form = _formKey.currentState;
//   if (_form!.validate()) {
//     print("Yes");
//   } else {
//     print("No");
//   }
// } 
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (!_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        print(result.user!.uid);
      } on PlatformException catch (e) {
        print(e.message.toString());
        
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text("ĐĂNG KÝ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text("Hãy tạo tài khoản",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                SizedBox(
                  height: 20,
                ),
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
                          validator: (value) {
                            if (value == "") {
                              return "Vui lòng nhập tên đăng nhập";
                            } else if (value!.length < 6) {
                              return "Tên đăng nhập quá ngắn";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_add,
                                color: Colors.lightBlue,
                              ),
                              hintText: 'Tên đăng nhập',
                              border: InputBorder.none),
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
                          validator: (value) {
                            if (value == "") {
                              return "Vui lòng nhập email!";
                            }
                            //  else if (!regExp.hasMatch(value!)) {
                            //   return "Email không hiệu lực";
                            // }
                            return "";
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_add,
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
                              return "Vui lòng nhập mật khẩu";
                            } else if (value!.length < 8) {
                              return "Mật khẩu quá ngắn";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_add,
                                color: Colors.lightBlue,
                              ),
                              hintText: 'Mật khẩu',
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                              print(password);
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
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Text(
                        'ĐĂNG KÝ',
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
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'Bạn đã có tài khoản? Đăng nhập?',
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
