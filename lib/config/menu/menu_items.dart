import 'package:flutter/material.dart' show IconData, Icons;

/// With this way, we can import only IconData class from material.dart library.
/// Optimizing the way we import classes from libraries.

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

var appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subTitle: 'Different types of buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'A stylized container',
    link: '/card',
    icon: Icons.credit_card,
  ),
];
