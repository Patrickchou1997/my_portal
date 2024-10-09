import 'package:flutter/material.dart';

enum NavigationItems { home, users, panel, pieChart, setting }

extension NavigationItemsExtensions on NavigationItems {
  IconData get icon {
    switch (this) {
      case NavigationItems.home:
        return Icons.home;
      case NavigationItems.panel:
        return Icons.bar_chart;
      case NavigationItems.pieChart:
        return Icons.pie_chart;
      case NavigationItems.users:
        return Icons.person;
      case NavigationItems.setting:
        return Icons.settings;
      default:
        return Icons.person;
    }
  }
}
