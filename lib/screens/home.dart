
//import 'package:app_history/screens/detailscreens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//import '../product_details_screen.dart';
//import '../search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  
  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").doc("a9h4Ih1fxiD6fpkl7PLs").collection("featureproducts").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          "description": qn.docs[i]["description"],
          "image": qn.docs[i]["image"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Search products here",
                  hintStyle: TextStyle(fontSize: 15),
                ),
                //onTap: () => Navigator.push(context,
                  //  CupertinoPageRoute(builder: (_) => SearchScreen())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
    
    //         Expanded(
    //           child: ListView.builder(
    //               itemCount: _products.length,
    //               itemBuilder: (_, index) {
    //                 return GestureDetector(
    //                   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
    //                   child: Card(
    //   elevation: 2.0,
    //   margin: EdgeInsets.only(bottom: 20.0),
    //   child: Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: Row(
    //         children: <Widget>[
    //           Container(
    //             width: 80.0,
    //             height: 80.0,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: NetworkImage(_products[index]["image"].toString()),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius: BorderRadius.circular(8.0),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 5.0,
    //           ),
    //           Expanded(
    //               child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "${_products[index]["name"]}",
    //                 style: TextStyle(
    //                   fontSize: 18.0,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 5.0,
    //               ),
    //               Row(
    //                 children: [
    //                   Icon(Icons.favorite),
    //                   SizedBox(
    //                     width: 10.0,
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ))
    //         ],
    //       )),
    // )
    //                 );
    //               }
    //               ),
    //         ),
          ],
        ),
      )),
    );
  }
}
