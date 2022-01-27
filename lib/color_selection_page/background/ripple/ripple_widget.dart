import 'package:flutter/material.dart';
import 'package:reflectly/color_selection_page/background/ripple/ripple_painter.dart';

class WRipple extends StatefulWidget {
  const WRipple({Key? key, required this.color}) : super(key: key);

  @override
  _WRippleState createState() => _WRippleState();

  final List<Color> color;
}

class _WRippleState extends State<WRipple> {
  @override
  Widget build(BuildContext context) {
    return _buildRadiusMultiplierTweenBuilder();
  }

  Widget _buildRadiusMultiplierTweenBuilder() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return _buildRippleCustomPainter(value);
      },
    );
  }

  Widget _buildRippleCustomPainter(final double radiusMultiplier) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: CustomPaint(
          painter: RipplePainter(widget.color, radiusMultiplier),
        ),
      );
    });
  }
}
