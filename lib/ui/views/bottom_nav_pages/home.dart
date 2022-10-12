// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/ui/views/product_details_screen.dart';
import 'package:e_commerce/ui/views/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  List<String> _carouselImages = [];
  List _product = [];
  var dotsPosition = 0;

  TextEditingController _searchController = TextEditingController();

  fatchCarCarouselImages() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel-slider").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
      }
    });
    return qn.docs;
  }

  fatchProduct() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("products-images").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _product.add({
          "product-name": qn.docs[i]["products-name"],
          "product-description": qn.docs[i]["products-description"],
          "product-price": qn.docs[i]["products-price"],
          "product-img": qn.docs[i]["products-img"],
        });
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fatchCarCarouselImages();
    fatchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "E-Commerce",
          style: TextStyle(
              color: Colors.black,
              fontSize: 35.0.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 30.0.h),
            Padding(
              padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 55.0.h,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Search products here",
                          hintStyle: TextStyle(height: 1.0.h),
                        ),
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchScreen())),
                      ),
                    ),
                  ),
                  Container(
                    height: 55.0.h,
                    width: 55.0.h,
                    decoration: BoxDecoration(
                      color: AppColors.pastelRed,
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          )),
                    ),
                  )
                ],
              ),
            ),
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
                items: _carouselImages
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(7.0.r),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item), fit: BoxFit.cover),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            
            SizedBox(height: 5.0.h),
            DotsIndicator(
              dotsCount:
                  _carouselImages.length == 0 ? 1 : _carouselImages.length,
              position: dotsPosition.toDouble(),
              decorator: DotsDecorator(
                color: Color.fromARGB(255, 246, 198, 194),
                activeColor: AppColors.pastelRed,
                size: Size(8.0.w, 8.0.h),
              ),
            ),
            SizedBox(height: 10.0.h),
            Padding(
              padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "View All >",
                    style: TextStyle(
                        color: AppColors.pastelRed,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            // SizedBox(height: 10.0.h),
            Expanded(
                child: GridView.builder(
                    itemCount: _product.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => ProductDetailsScreen(_product[index]))),
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 1.4,
                                  child: Image.network(
                                      _product[index]["product-img"][0])),
                              Text("${_product[index]["product-name"]}"),
                              Text(
                                "${_product[index]["product-price"].toString()}Tk",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
