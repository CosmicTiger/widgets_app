import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    /// NOTE: With this particular method you are able to clear out any Snackbars in the execution stack
    final snackbar = SnackBar(
        content: const Text('This is a custom SnackBar'),
        duration: const Duration(seconds: 5), // Duration of the SnackBar
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('This is a custom Dialog'),
              content: const Text(
                  'In officia et ex irure. Lorem ipsum irure proident mollit. Ipsum enim voluptate sunt eiusmod proident in ea sint incididunt non.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Accept'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    /// NOTE: We could make a key for the Scaffold and from that point on
    /// Other way to do it is by letting Flutter know that to the nearest screen, render the SnackBar
    /// Which would be the approach used on this example.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & Dialogs'), // Title of the screen
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text('This is a custom About Dialog'),
              ]);
            },
            child: const Text('Used Licenses')),

        /// NOTE: The usage on this component is whenever we may like to show the licenses used in our application.
        FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Show Dialogs'))
      ])),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
