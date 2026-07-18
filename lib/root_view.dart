import 'package:flutter/material.dart';

import '../../core/utils/constant.dart';
import 'features/cart_feature/presentation/views/cart_view.dart';
import 'features/checkout_feature/presentation/views/checkout_view.dart';
import 'features/favourite_feature/presentation/views/favourites_view.dart';
import 'features/home_feature/presentation/views/home_view.dart';
import 'features/order_history_feature/presentation/views/order_history_view.dart';
import 'features/profile_feature/presentation/views/profile_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController pageController;

  int currentIndex = 0;

  final List<Widget Function()> pages = [
        () => const HomeView(),
        () => const CartView(),
        () => const FavouritesView(),
        () => const OrderHistoryView(),
        () => const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool get _isFavouritesPage => pages[currentIndex]() is FavouritesView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isFavouritesPage
          ? kSecondaryColor
          : Colors.white,
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return pages[index]();
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 5,
            left: 20,
            right: 20,
          ),
          height: 75,
          color: kPrimaryColor,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_restaurant_sharp),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}