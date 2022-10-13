import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // final Stream userStream = FirebaseFirestore.instance
  //     .collection("user-cart-Items")
  //     .doc(FirebaseAuth.instance.currentUser!.email)
  //     .collection("Items")
  //     .snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user-cart-Items")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("Items")
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something is wrong"));
              }
              return ListView.builder(
                  itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, index) {
                    DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Image.network(_documentSnapshot['images'][0]),
                        title: Text(_documentSnapshot['name']),
                        subtitle: Text(
                          "\$ ${_documentSnapshot['price']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        trailing: CircleAvatar(
                          child: IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("user-cart-Items")
                                    .doc(FirebaseAuth
                                        .instance.currentUser!.email)
                                    .collection("Items")
                                    .doc(_documentSnapshot.id)
                                    .delete();
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
