import 'package:flutter/material.dart';

import 'background/background_widget.dart';
import 'color_selection_icons/color_selection_icons.dart';

class WColorSelectionPage extends StatefulWidget {
  const WColorSelectionPage({Key? key}) : super(key: key);

  @override
  _WColorSelectionPageState createState() => _WColorSelectionPageState();
}

class _WColorSelectionPageState extends State<WColorSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return WBackground(
      controller: _backgroundController,
      initialColor: colors[0],
      // color: colors[0][0],
      child: Column(
        children: <Widget>[
          _buildUpperSection(),
          Expanded(child: _buildColorSelectionIcons()),
        ],
      ),
    );
  }

  Widget _buildUpperSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        CircleAvatar(),
        Text("Boom - Magic Color Change!"),

        Text("CAN BE CHANGED LATER IN SETTINGS"),
      ],
    );
  }

  Widget _buildColorSelectionIcons(){
    void onTapDownCallback(final List<Color> color) => _backgroundController.doPulse(color);
    return WColorSelectionIcons(colors: colors, onTapDown: onTapDownCallback,);
  }

  final BackgroundController _backgroundController = BackgroundController();

  final List<List<Color>> colors = <List<Color>>[
    [const Color(0xFF00E0D3), const Color(0xFF00B4D4)],
    [const Color(0xFF00B4D4), const Color(0xFF409CAE)],
    [const Color(0xFF66D8A4), const Color(0xFF409CAE)],
    [const Color(0xFFFC727B), const Color(0xFFF468A0)],
    [const Color(0xFF8289EA), const Color(0xFF7A6FC1)],
    [const Color(0xFFFEC7A3), const Color(0xFFFD9F9C)]
  ];
}
