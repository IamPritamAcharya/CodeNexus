import 'package:comp/pages%20&%20hidden%20drawer/hidden_drawer_page.dart';
import 'package:comp/pages%20&%20hidden%20drawer/pages.dart';
import 'package:flutter/material.dart';

import 'package:comp/main%20page/main_page.dart';
import 'package:comp/main%20page/NavBar/top_nav_bar.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'sign in/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: '', 
    anonKey: '', 
  );
  runApp(CompetitiveProgrammingApp());
}

class CompetitiveProgrammingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white, // Text color for primary elements
        scaffoldBackgroundColor: Colors.black, // Background color for the app
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Match AppBar color to main theme
          elevation: 0, // Make it flat
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white, // Define button colors
          textTheme: ButtonTextTheme.primary,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LayoutWrapper(child: MainPage(), selectedIndex: 0),
        '/home': (context) => LayoutWrapper(child: MainPage(), selectedIndex: 0),
        '/login': (context) => LayoutWrapper(child: LoginPage(), selectedIndex: 1),

        // Additional routes
      },
    );
  }
}


class LayoutWrapper extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  LayoutWrapper({required this.child, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Use the hidden drawer for small screens
      return HiddenDrawerPage(selectedIndex: selectedIndex);
    } else {
      // Use a transparent custom top nav bar for larger screens
      return Scaffold(
        backgroundColor: Colors.transparent, // Ensure no background color
        body: Stack(
          children: [
            child, // Main content
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomTopNavBar(appPages: appPages),
            ),
          ],
        ),
      );
    }
  }
}
