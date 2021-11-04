import 'package:app_history/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce/widgets/fetchProducts.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-favourite-items")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something is wrong"),
                );
              }
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text(_documentSnapshot['name']),
                        trailing: GestureDetector(
                          child: CircleAvatar(
                            child: Icon(Icons.remove_circle),
                          ),
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection("users-favourite-items")
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection("items")
                                .doc(_documentSnapshot.id)
                                .delete();
                          },
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
