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
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generals and Controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars & Dialogs',
    subTitle: 'Indicators in screen',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget with animation',
    link: '/animated',
    icon: Icons.check_box_outline_blank,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Examples of a series of controls on Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introduction to applications',
    subTitle: 'Small tutorials on applications',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItem(
    title: 'InfiniteScroll & Pull',
    subTitle: 'Infinite Lists and Pull events for resources on lists',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Riverpod Counter',
    subTitle: 'Introduction to Riverpod',
    link: '/counter-riverpod',
    icon: Icons.add_box_outlined,
  ),
  MenuItem(
    title: 'Change Theme',
    subTitle: 'Changes Theme of the App',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
