import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String ?image;
  final String name;
  
  SingleProduct({this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    image: NetworkImage(image!),
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
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }
}
