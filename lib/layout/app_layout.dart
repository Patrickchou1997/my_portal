import 'package:flutter/material.dart';
import 'package:my_portal/layout/navigation_panel.dart';
import 'package:my_portal/responsive.dart';

class AppLayout extends StatefulWidget {
  final Widget content;
  final Function(int) onTabSelected; // Add callback

  const AppLayout({
    super.key,
    required this.content,
    required this.onTabSelected, // Pass the callback
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget.content, // Render the content from HomePage
            ),
          ),
          NavigationPanel(
            axis: Axis.horizontal,
            onTabSelected: widget.onTabSelected, // Pass the callback
          ),
        ],
      ),
      desktop: Row(
        children: [
          NavigationPanel(
            axis: Axis.vertical,
            onTabSelected: widget.onTabSelected, // Pass the callback
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 100, child: TopAppBar()),
                  Expanded(child: widget.content), // Render the content here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
