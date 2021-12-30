import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    Key? key,
    required this.function,
  }) : super(key: key);
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
