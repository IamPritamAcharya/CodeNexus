import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import '../cache_manager.dart';
import 'pages.dart';

class HiddenDrawerPage extends StatelessWidget {
  final int selectedIndex;

  const HiddenDrawerPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ScreenHiddenDrawer>>(
        future: getHiddenDrawerScreens(), // Fetch screens dynamically
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Show error message if something goes wrong
            return Center(
              child: Text("Error loading screens: ${snapshot.error}"),
            );
          }

          final hiddenDrawerScreens = snapshot.data!;
          return HiddenDrawerMenu(
            screens: hiddenDrawerScreens,
            initPositionSelected: selectedIndex,
            leadingAppBar: const Icon(Icons.menu, color: Colors.white),
            withAutoTittleName: false,
            elevationAppBar: 0,
            curveAnimation: Curves.easeInOutSine,
            typeOpen: TypeOpen.FROM_LEFT,
            slidePercent: 40,
            contentCornerRadius: 50,
            isDraggable: true,
            disableAppBarDefault: false,
            backgroundColorMenu: const Color.fromARGB(255, 18, 18, 18),
            backgroundColorAppBar: Colors.black,
            actionsAppBar: selectedIndex != 1
                ? [
                    IconButton(
                      icon: const Icon(Icons.person_outlined, color: Colors.white),
                      onPressed: () async {
                        // Check if the user is logged in
                        final user = await CacheManager.getUserCache();
                        if (user == null) {
                          // Navigate to the login page if not logged in
                          Navigator.pushNamed(context, '/login');
                        } else {
                          // Navigate to the profile page if logged in
                          Navigator.pushNamed(context, '/profile');
                        }
                      },
                    ),
                  ]
                : null,
          );
        },
      ),
    );
  }
}
