import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'infinite_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Progress Indicators'), // Title of the screen
        ),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 30),
        const Text('Circular Progress Indicator'),
        const SizedBox(height: 10),
        const CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black45,
        ),
        const SizedBox(height: 20),
        const Text('Circular Progress Indicator Controlled'),
        _ControlledProgressIndicator(isLinear: false),
        const SizedBox(height: 10),
        const SizedBox(height: 20),
        const Text('Linear Progress Indicator Controlled'),
        _ControlledProgressIndicator(isLinear: true),
        const SizedBox(height: 10),
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  final bool isLinear;

  const _ControlledProgressIndicator({required this.isLinear});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value <= 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLinear)
                  CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 2,
                    backgroundColor: Colors.black45,
                  ),
                const SizedBox(width: 20),
                if (isLinear)
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.black45,
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
