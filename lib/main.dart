import 'package:flutter/material.dart';
import 'package:my_portal/layout/app_layout.dart';
import 'package:my_portal/styles/light_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Keep track of the current theme mode (light/dark)
  ThemeMode _themeMode = ThemeMode.light;

  // Function to toggle between light and dark mode
  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: LightStyles.scaffoldBackgroundColor,
        scrollbarTheme: LightStyles.scrollbarTheme,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        scrollbarTheme: LightStyles.scrollbarTheme,
      ),
      themeMode: _themeMode, // Use the current theme mode
      home: MyHomePage(title: 'Page', toggleTheme: _toggleTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});
  final String title;
  final VoidCallback toggleTheme; // Callback to toggle theme

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeTab = 0;

  void onTabSelected(int index) {
    setState(() {
      _activeTab = index;
      print(_activeTab);
      if (_activeTab == 4) {
        widget.toggleTheme();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: Center(
            child: Text('${widget.title}: $_activeTab'),
          ),
          onTabSelected: onTabSelected,
        ),
      ),
    );
  }
}
