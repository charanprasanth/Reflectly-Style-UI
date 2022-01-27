import 'package:flutter/material.dart';
import 'package:reflectly/color_selection_page/color_selection_icons/color_selection_icon.dart';

class WColorSelectionIcons extends StatefulWidget {
  const WColorSelectionIcons(
      {Key? key, required this.colors, required this.onTapDown})
      : super(key: key);

  @override
  _WColorSelectionIconsState createState() => _WColorSelectionIconsState();

  final List<List<Color>> colors;
  final void Function(List<Color> color) onTapDown;
}

class _WColorSelectionIconsState extends State<WColorSelectionIcons> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _scrollAmount = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) => _buildPage(index, widget.colors[index]),
    );
  }

  Widget _buildPage(int index, final List<Color> color) {
    return Center(
      child: WColorSelectionIcon(
        index: index,
        scrollAmount: _scrollAmount,
        color: color,
        onTapDown: widget.onTapDown,
      ),
    );
  }

  double _scrollAmount = 0.0;

  final PageController _pageController =
      PageController(viewportFraction: 1 / 3);
}
