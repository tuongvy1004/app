//import 'package:app_history/screens/detailproduct.dart';
import 'package:app_history/screens/detailproduct.dart';

import 'package:app_history/screens/favourite.dart';
import 'package:app_history/widgets/searchscreen.dart';
import 'package:app_history/widgets/singleproduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List _products = [];

  fetchProducts() async {
    QuerySnapshot qn = await FirebaseFirestore.instance.collection("products").doc("a9h4Ih1fxiD6fpkl7PLs").collection("featureproducts").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          "description": qn.docs[i]["description"],
          "image": qn.docs[i]["image"],
          "translate":qn.docs[i]["translate"]
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
      key: _key,
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Tuong Vy",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(color: Colors.white24),
            accountEmail: Text("tuongvy@gmail.com",
                style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            selected: true,
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text("Trang chủ"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Favourite()));

            },
            leading: Icon(Icons.favorite),
            title: Text("Yêu thích"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.info),
            title: Text("About us"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.phone),
            title: Text("Liên hệ"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Đăng xuất"),
          ),
        ]),
      ),
      appBar: AppBar(
        toolbarHeight: 110.0,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "History App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top:10),
              child: TextFormField(
                decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          onTap: () => Navigator.push(context,
                              CupertinoPageRoute(builder: (_) => SearchScreen())),
                //onTap: () => Navigator.push(context,
                  //  CupertinoPageRoute(builder: (_) => SearchScreen())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
    
            Expanded(
              child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailScreens(_products[index]))),
                      child: Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 20.0),
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_products[index]["image"].toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_products[index]["name"]}",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  
                ],
              ))
            ],
          )),
    )
                    );
                  }
                  ),
            ),
          ],
        ),
      )),
    
    );
  }
}
