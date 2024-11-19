
import 'package:comp/online%20code%20compiler/code_execution_screen.dart';
import 'package:comp/main%20page/main_page.dart';
import 'package:comp/sign%20in/login_page.dart';
import 'package:comp/sign%20in/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';

import '../cache_manager.dart';

// Structure for each page, label, and icon
class AppPage {
  final Widget page;
  final String label;
  final IconData icon;

  AppPage({required this.page, required this.label, required this.icon});
}

// List of pages with labels and icons for both Sidebar and HiddenDrawer
List<AppPage> appPages = [
  AppPage(page: MainPage(), label: "Home", icon: Icons.home),
  AppPage(page: const CodeExecutionScreen(), label: "Compiler", icon: Icons.tab),
];


Future<List<ScreenHiddenDrawer>> getHiddenDrawerScreens() async {
  // Check if the user is logged in
  final user = await CacheManager.getUserCache();
  bool isLoggedIn = user != null;

  return [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "Home",
        baseStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.white,
        ),
        selectedStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.teal,
        ),
        colorLineSelected: Colors.teal,
      ),
      MainPage(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: isLoggedIn ? "Profile" : "User",
        baseStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.white,
        ),
        selectedStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.teal,
        ),
        colorLineSelected: Colors.teal,
      ),
      isLoggedIn ? UserInfoPage() : LoginPage(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "Compiler",
        baseStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.white,
        ),
        selectedStyle: GoogleFonts.montserrat(
          fontSize: 18,
          color: Colors.teal,
        ),
        colorLineSelected: Colors.teal,
      ),
      CodeExecutionScreen(),
    ),
  ];
}
