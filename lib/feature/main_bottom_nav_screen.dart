import 'dart:io';

import 'package:evencir_test/configs/routing/bottom_nav_tab.dart';
import 'package:evencir_test/core/constants/app_assets.dart';
import 'package:evencir_test/core/utils/extensions/extensions.dart';
import 'package:evencir_test/feature/categories/categories_screen.dart';
import 'package:evencir_test/feature/favorites/favorites_screen.dart';
import 'package:evencir_test/feature/products/products_list_screen.dart';
import 'package:evencir_test/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({
    super.key,
    this.initialTab = BottomNavTab.products,
    this.paramIndex = 0,
  });

  final BottomNavTab initialTab;
  final int paramIndex; // Keep for backward compatibility

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  late BottomNavTab _selectedTab;

  int get _selectedIndex => _selectedTab.navigationIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = BottomNavTab.fromIndex(index);
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  void initState() {
    _selectedTab = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop =
            await context.showConfirmationDialog(
              title: 'Exit',
              content: 'Do you really want to exit?',
              onPressed: () {
                context.pop(true);
              },
            ) ??
            false;
        if (context.mounted && shouldPop) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            ProductsListScreen(),
            CategoriesScreen(),
            FavoritesScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).shadowColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) =>
              setState(() => _selectedTab = BottomNavTab.values[index]),
          items: [
            _buildNavItem('Products', 0, AppAssets.productIcon),
            _buildNavItem('Categories', 1, AppAssets.categoryIcon),
            _buildNavItem('Favourites', 2, AppAssets.favoriteIcon),
            _buildNavItem('Faez Ansar', 3, AppAssets.profileIcon),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String label,
    int index,
    String assetPath,
  ) {
    final bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.grey.shade300.withValues(alpha: .1)
              : Colors.transparent,
        ),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 18.w, // set size explicitly
              height: 18.h,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
