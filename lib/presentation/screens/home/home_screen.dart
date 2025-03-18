import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
        leading: Icon(menuItem.icon, color: colors.primary),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        onTap: () {
          /// TODO: Navigate to the selected screen
          /// This is implemented whenever you may want to use the native approach on navigations
          /// But is not eligible when you want to use the named routes approach
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => const ButtonsScreen()),
          // );

          /// This is the named routes approach
          /// nonetheless, the most recommended approach for everyone in Flutter community
          /// simply because deep linking issues are solved by default is the GoRouter package
          // Navigator.pushNamed(context, menuItem.link);

          /// If I don't want to use context.push from GoRouter I could use the followed approach of this comment.
          /// context.pushNamed(menuItem.name); In case that menuLink has this routing system configured which is using
          /// the lexical naming convention.
          context.push(menuItem.link);
        });
  }
}
