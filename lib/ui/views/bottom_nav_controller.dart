import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/ui/views/bottom_nav_pages/cart.dart';
import 'package:e_commerce/ui/views/bottom_nav_pages/favourite.dart';
import 'package:e_commerce/ui/views/bottom_nav_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottom_nav_pages/profile.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  State<BottomNavController> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNavController> {
  int _currentIndex = 0;
  final navPages = [Home(), Favourite(), Cart(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Commerce",
          style: TextStyle(
              color: Colors.black,
              fontSize: 35.0.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.pastelRed,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        backgroundColor: AppColors.mintCream,
        type: BottomNavigationBarType.fixed,
        onTap: (values) {
          setState(() {
            _currentIndex = values;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: navPages[_currentIndex],
    );
  }
}
