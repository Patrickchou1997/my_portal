import 'package:flutter/material.dart';
import 'package:my_portal/models/enums/navigation_items.dart'; // Ensure this exists
import 'package:my_portal/widgets/navigation_button.dart'; // Ensure this exists
import 'package:my_portal/responsive.dart';

class NavigationPanel extends StatefulWidget {
  final Axis axis;
  final Function(int) onTabSelected; // Callback for tab selection

  const NavigationPanel(
      {super.key, required this.axis, required this.onTabSelected});

  @override
  State<NavigationPanel> createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          : const EdgeInsets.all(10),
      child: SingleChildScrollView(
        // Add scrollable behavior
        scrollDirection: widget.axis, // Enable scrolling in the axis direction
        child: widget.axis == Axis.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: NavigationItems.values
                    .map(
                      (e) => NavigationButton(
                        onPressed: () {
                          setState(() {
                            activeTab = e.index;
                            widget.onTabSelected(activeTab); // Notify parent
                          });
                        },
                        icon: e.icon,
                        isActive: e.index == activeTab,
                      ),
                    )
                    .toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: NavigationItems.values
                    .map(
                      (e) => NavigationButton(
                        onPressed: () {
                          setState(() {
                            activeTab = e.index;
                            widget.onTabSelected(activeTab); // Notify parent
                          });
                        },
                        icon: e.icon,
                        isActive: e.index == activeTab,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
