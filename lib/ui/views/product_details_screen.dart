import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/ui/widgets/pastelButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsScreen extends StatefulWidget {
  var _products;
  ProductDetailsScreen(this._products);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var dotsPosition = 0;

  addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("user-cart-Items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("Items")
        .doc()
        .set({
      "name": widget._products["product-name"],
      "price": widget._products["product-price"],
      "images": widget._products["product-img"],
    }).then((value) => Fluttertoast.showToast(msg: "Added To Cart"));
  }

  addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("user-fav-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._products["product-name"],
      "price": widget._products["product-price"],
      "images": widget._products["product-img"],
    }).then((value) => Fluttertoast.showToast(msg: "Added To Favourite"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.pastelRed,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.pastelRed,
              child: IconButton(
                onPressed: () => addToFavourite(),
                icon: Icon(Icons.favorite_border_outlined, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0.h),
            AspectRatio(
              aspectRatio: 3.5,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 155.0.h,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  // autoPlay: true,
                  onPageChanged: (currentIndex, carouselPageChangedReason) {
                    setState(() {
                      dotsPosition = currentIndex;
                    });
                  },
                ),
                items: widget._products["product-img"]
                    .map<Widget>((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(7.0.r),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(item)),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 5.0.h),
            DotsIndicator(
              dotsCount: widget._products["product-img"].length,
              position: dotsPosition.toDouble(),
              decorator: DotsDecorator(
                color: Color.fromARGB(255, 246, 198, 194),
                activeColor: AppColors.pastelRed,
                size: Size(8.0.w, 8.0.h),
              ),
            ),
            SizedBox(height: 35.0.h),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, right: 22.0.w),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget._products["product-name"]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "${widget._products["product-price"]}Tk",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 15.0.h),
                    Text(
                      "${widget._products["product-description"]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 150.0.h),
                    Center(
                        child:
                            PastelRedButton("Add to cart", () => addToCart())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
