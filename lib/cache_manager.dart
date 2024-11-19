import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CacheManager {
  static const String _userCacheKey = 'user_cache';

  // Save user details to cache
  static Future<void> saveUserCache(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user);
    await prefs.setString(_userCacheKey, userJson);
  }

  // Get user details from cache
  static Future<Map<String, dynamic>?> getUserCache() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userCacheKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  // Clear user cache
  static Future<void> clearUserCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userCacheKey);
  }

  // Refresh user details from the server
  static Future<Map<String, dynamic>?> refreshUserCache(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        await saveUserCache(response);
        return response;
      } else {
        throw Exception('User not found.');
      }
    } catch (e) {
      throw Exception('Failed to refresh user data: $e');
    }
  }
}
