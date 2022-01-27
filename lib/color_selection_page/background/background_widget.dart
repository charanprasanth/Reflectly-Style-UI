import 'package:flutter/material.dart';
import 'package:reflectly/color_selection_page/background/ripple/ripple_widget.dart';

class WBackground extends StatefulWidget {
  const WBackground(
      {Key? key,
      required this.initialColor,
      required this.child,
      required this.controller})
      : super(key: key);

  @override
  _WBackgroundState createState() => _WBackgroundState();

  final BackgroundController controller;
  final List<Color> initialColor;
  final Widget child;
}

class _WBackgroundState extends State<WBackground> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: _initialGradient(),
          ),
        ),
        _buildRipples(),
        widget.child,
      ],
    );
  }

  Widget _buildRipples() {
    return Stack(
      children: widget.controller.widgets,
    );
  }

  LinearGradient _initialGradient() {
    return LinearGradient(
      colors: <Color>[widget.initialColor[1], widget.initialColor[0]],
      stops: const <double>[0.0, 0.7],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }

  void update() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(update);
  }
}

class BackgroundController extends ChangeNotifier {
  void doPulse(List<Color> color, Offset from) {
    void onEndCallback(final Widget widget) {
      if (widgets.last == widget) return;
      widgets.remove(widget);
    }

    final WRipple ripple = WRipple(
      color: color,
      center: from,
      onEnd: onEndCallback,
    );
    widgets.add(ripple);
    notifyListeners();
  }

  List<Widget> widgets = <Widget>[];
}
