import 'package:app_history/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailScreens extends StatefulWidget {
  var _product;

  DetailScreens(this._product);

  @override
  _DetailScreensState createState() => _DetailScreensState();
}

class _DetailScreensState extends State<DetailScreens> {
  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._product["name"],
      "images": widget._product["image"],
    }).then((value) => print("Added to favourite"));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        bottom: TabBar(
          labelColor: Colors.black87,
                    indicatorColor: Colors.deepOrange,
                    unselectedLabelColor: Colors.grey,
          tabs:[
            Tab(text: 'VIETNAMESE'),
            Tab(text: 'ENGLISH')
          ]
        ),

        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-favourite-items")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .where("name", isEqualTo: widget._product['name'])
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text("");
              }
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    onPressed: () => snapshot.data.docs.length == 0
                        ? addToFavourite()
                        : print("Already Added"),
                    icon: snapshot.data.docs.length == 0
                        ? Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: TabBarView(
        children:<Widget> [
            Card(
              child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 350,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(13),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget._product['image']),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      widget._product['name'],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      widget._product["description"],
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
            ),
            Card(
              child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 350,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(13),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget._product['image']),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      widget._product['name'],
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      widget._product["translate"],
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
            )
          ],
      )
      // body: Container(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[
      //         Center(
      //           child: Container(
      //             width: 350,
      //             child: Card(
      //               child: Container(
      //                 padding: EdgeInsets.all(13),
      //                 child: Container(
      //                   height: 220,
      //                   decoration: BoxDecoration(
      //                       image: DecorationImage(
      //                     fit: BoxFit.fill,
      //                     image: NetworkImage(widget._product['image']),
      //                   )),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10.0,
      //         ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 8.0),
      //           child: Column(
      //             children: [
      //               Text(
      //                 widget._product['name'],
      //                 style: TextStyle(
      //                   fontSize: 22.0,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10.0,
      //               ),
      //               SizedBox(
      //                 height: 12.0,
      //               ),
      //               Text(
      //                 widget._product["description"],
      //                 style: TextStyle(
      //                   fontSize: 18.0,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    ));
  }
}
