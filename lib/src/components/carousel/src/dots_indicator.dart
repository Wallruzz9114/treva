import 'dart:math';
import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {

  const DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color,
    this.dotSize,
    this.dotIncreaseSize,
    this.dotSpacing
  }) : super(listenable: controller);

  // The PageController that this DotsIndicator is representing.
  final PageController controller;

  // The number of items managed by the PageController
  final int itemCount;

  // Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The color of the dots.
  final Color color;

  // The base size of the dots
  final double dotSize;

  // The increase in the size of the selected dot
  final double dotIncreaseSize;

  // The distance between the center of each dot
  final double dotSpacing;

  Widget _buildDot(int index) {
    final double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    final double zoom = 1.0 + (dotIncreaseSize - 1.0) * selectedness;
    
    return Container(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: dotSize * zoom,
            height: dotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
  
}