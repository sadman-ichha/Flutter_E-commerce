import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
          child: Column(
            children: [
              SizedBox(height: 30.0.h),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    inputText = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search products here",
                ),
              ),
              SizedBox(height: 20.0.h),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("products-images")
                      .where("products-name", isEqualTo: inputText)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("Something went wrong"));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text("Loading.."));
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(data["products-name"]),
                            subtitle:
                                Text("${data["products-price"].toString()}Tk"),
                            leading: Image.network(data["products-img"][0]),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
