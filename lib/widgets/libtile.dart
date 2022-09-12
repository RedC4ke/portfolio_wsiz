import 'package:flutter/material.dart';

class LibTile extends StatelessWidget {
  final Widget child;

  const LibTile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
