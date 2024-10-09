import 'package:flutter/material.dart';
import 'package:my_portal/styles/light_styles.dart'; // Import for light theme styles
import 'package:my_portal/styles/dark_styles.dart'; // Import for dark theme styles

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // Get the current theme to determine which styles to use
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Determine colors based on the current theme
    final backgroundColor = isActive
        ? (isDarkMode
            ? DarkStyles.defaultYellowColor
            : LightStyles.defaultYellowColor)
        : (isDarkMode
            ? DarkStyles.defaultLightWhiteColor
            : LightStyles.defaultLightWhiteColor);

    final iconColor =
        isActive ? (isDarkMode ? Colors.black : Colors.white) : Colors.grey;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
      ),
    );
  }
}
