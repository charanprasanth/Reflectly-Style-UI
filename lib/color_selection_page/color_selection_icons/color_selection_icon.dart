import 'dart:ui';

import 'package:flutter/material.dart';

class WColorSelectionIcon extends StatefulWidget {
  const WColorSelectionIcon(
      {Key? key,
      required this.color,
      required this.scrollAmount,
      required this.index,
      required this.onTapDown})
      : super(key: key);

  @override
  _WColorSelectionIconState createState() => _WColorSelectionIconState();

  final List<Color> color;
  final double scrollAmount;
  final int index;
  final void Function(int index, List<Color> color, TapDownDetails) onTapDown;
}

class _WColorSelectionIconState extends State<WColorSelectionIcon> {
  @override
  Widget build(BuildContext context) {
    final double clampedDifference =
        (widget.scrollAmount - widget.index).clamp(-1, 1);
    final Offset offset = Offset(0.0, 128.0 * clampedDifference);
    final double? scale = lerpDouble(1.0, 0.8, clampedDifference.abs());
    return Transform.translate(
      offset: offset,
      child: Transform.scale(
        scale: scale!,
        child: GestureDetector(
          onTapDown: (tapDownDetails) => widget.onTapDown(widget.index, widget.color, tapDownDetails),
          child: _buildIcon(),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    const double diameter = 100.0;
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8.0,
      shape: BoxShape.circle,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          gradient: _gradient(),
          border: Border.all(color: Colors.white, width: 4.0),
          borderRadius: BorderRadius.circular(3000),
        ),
      ),
    );
  }

  LinearGradient _gradient() {
    return LinearGradient(
      colors: <Color>[widget.color[1], widget.color[0]],
      stops: const <double>[0.0, 0.3],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}
