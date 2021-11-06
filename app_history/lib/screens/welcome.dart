import 'package:app_history/screens/login.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text('History World',
                    style: TextStyle(
                        fontSize: 52,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
                child: Container(
                    child: Column(
              children: [
                Container(
                  width: 350,
                  child: RawMaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                    fillColor: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    },
                    child: Text(
                      'ĐĂNG NHẬP',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 350,
                    child: RawMaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                        fillColor: Colors.lightBlue[50],
                        onPressed: () {},
                        child: Text(
                          'ĐĂNG KÝ',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            )))
          ],
        ),
      ),
    );
  }
}
