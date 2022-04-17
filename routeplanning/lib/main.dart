import 'package:flutter/material.dart';
import 'package:routeplanning/pages/UserPage.dart';
import 'package:routeplanning/pages/LoginPage.dart';
import 'package:routeplanning/pages/AdminPage.dart';
import 'package:routeplanning/pages/MapPage.dart';
import 'input_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: DisableScrollGlow(),
          child: child!,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputTheme().theme(),
      ),
      initialRoute: "/map",
      routes: {
        "/login": (context) => const LoginPage(),
        "/userpage": (context) => const UserPage(),
        "/adminpage": (context) => const AdminPage(),
        "/map": (context) => const MapPage(),
      },
    );
  }
}

class DisableScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
