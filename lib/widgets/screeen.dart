import 'package:calculator/providers/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Screen extends ConsumerStatefulWidget {
  const Screen({super.key});

  @override
  ConsumerState<Screen> createState() => _ScreenState();
}

class _ScreenState extends ConsumerState<Screen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(screenProvider);
    return SizedBox(
      height: ((MediaQuery.of(context).size.height) ~/ 4).toDouble(),
      child: Container(
          padding: const EdgeInsets.all(3),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              ref.watch(screenProvider.notifier).getItems(),
              style: const TextStyle(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
