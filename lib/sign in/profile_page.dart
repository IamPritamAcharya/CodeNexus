import 'package:comp/cache_manager.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late Future<Map<String, dynamic>?> _userInfoFuture;

  @override
  void initState() {
    super.initState();
    _userInfoFuture = _getUserInfo();
  }

  Future<Map<String, dynamic>?> _getUserInfo() async {
    return await CacheManager.getUserCache();
  }

  Future<void> _refreshUserInfo() async {
    try {
      final cachedUser = await CacheManager.getUserCache();
      if (cachedUser != null) {
        final userId = cachedUser['id'];
        final refreshedUser = await CacheManager.refreshUserCache(userId);

        if (refreshedUser != null) {
          setState(() {
            _userInfoFuture = Future.value(refreshedUser);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User data refreshed successfully!')),
          );
        }
      } else {
        throw Exception('No user data to refresh.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to refresh data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshUserInfo,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _userInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return Center(child: Text('No user data found.'));
          }

          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user['name']}'),
                Text('Branch: ${user['branch']}'),
                Text('Year: ${user['year']}'),
                Text('Rating: ${user['rating']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
