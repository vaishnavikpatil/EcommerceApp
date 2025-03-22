import 'package:ecommerce_app/screens/cart.dart';
import 'package:ecommerce_app/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    const Center(child: Text('Search Screen', style: TextStyle(fontSize: 24))),
    Cart(),
    const Center(child: Text('Favorites Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 50.0;
    final totalItemsWidth = itemWidth * 4;
    final totalSpacing = screenWidth - totalItemsWidth;
    final spaceBetween = totalSpacing / 5;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFEEEEEE), width: 1.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spaceBetween),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(0, Icons.storefront),
                  _buildNavItem(1, Icons.search),
                  _buildNavItem(2, Icons.shopping_basket_outlined),
                  _buildNavItem(3, Icons.favorite_border),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                (spaceBetween + (_selectedIndex * (itemWidth + spaceBetween))) - (screenWidth / 2) + 25,
                0,
                0,
              ),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(color: Color(0xFFEF6C00), shape: BoxShape.circle),
                    child: Icon(_getIconForIndex(_selectedIndex), color: Colors.white, size: 26),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _selectedIndex == index ? 0.0 : 1.0,
          child: Icon(icon, color: Colors.grey, size: 24),
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.storefront;
      case 1:
        return Icons.search;
      case 2:
        return CupertinoIcons.shopping_cart;
      case 3:
      default:
        return Icons.favorite_border;
    }
  }
}
