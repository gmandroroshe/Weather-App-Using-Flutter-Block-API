// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/sign_in_page.dart';
import 'screens/home_page.dart';
import 'screens/search_page.dart';
import 'screens/add_post_page.dart';
import 'screens/notifications_page.dart';
import 'screens/account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/add_post': (context) => AddPostPage(),
        '/notifications': (context) => NotificationsPage(),
        '/account': (context) => AccountPage(),
      },
    );
  }
}
