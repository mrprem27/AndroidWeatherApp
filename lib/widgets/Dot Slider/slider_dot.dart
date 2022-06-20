import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {
  final bool isActive;
  SliderDot(this.isActive, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 4,
      height: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
