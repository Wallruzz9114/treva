import 'package:flutter/material.dart';
import 'package:treva/src/screens/home/home_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();

}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget _callPage(int current) {
    switch (current) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return ShopScreen();
        break;
      case 2:
        return CartScreen();
        break;
      case 3:
        return ProfileScreen();
        break;
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(
              color: Colors.black26.withOpacity(0.15)
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          fixedColor: const Color(0xFF6991C7),
          onTap: (int value) {
            currentIndex = value;
            setState(() {
              
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 23.0,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Berlin',
                  letterSpacing: 0.5
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.shop,
                size: 23.0,
              ),
              title: Text(
                'Shop',
                style: TextStyle(
                  fontFamily: 'Berlin',
                  letterSpacing: 0.5
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.shopping_cart,
                size: 23.0,
              ),
              title: Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'Berlin',
                  letterSpacing: 0.5
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
                size: 23.0,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Berlin',
                  letterSpacing: 0.5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}