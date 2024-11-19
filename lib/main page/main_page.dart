import 'package:comp/pages%20&%20hidden%20drawer/pages.dart';
import 'package:comp/main%20page/AuroraBackground.dart';
import 'package:comp/main%20page/NavBar/top_nav_bar.dart';
import 'package:comp/main%20page/secondhero/secondhero.dart';
import 'package:comp/main%20page/thirdhero/thirdhero.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'hero/center_text.dart';
import 'hero/action_button.dart';
import 'hero/code_snippet.dart';

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust height for SizedBox based on screen width
    double topSpacing = screenWidth < 600 ? 100.0 : 180.0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AuroraBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: topSpacing), // Responsive spacing
                      CenterText(),
                      SizedBox(height: 20),
                      ActionButton(),
                      SizedBox(height: 20),
                      CodeSnippet(),
                      SizedBox(height: 80),
                      SecondHero(), 
                      SizedBox(height: 80),
                      ThirdHero(), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
