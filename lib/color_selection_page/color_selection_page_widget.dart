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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: <Widget>[
            _buildUpperSection(),
            Expanded(child: _buildColorSelectionIcons()),
            _buildNextButton(),
            const SizedBox(height: 16.0),
            _buildPageIndexIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpperSection() {
    final ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const PhysicalModel(
          color: Colors.transparent,
          elevation: 8.0,
          shape: BoxShape.circle,
          child: CircleAvatar(backgroundColor: Colors.white, radius: 32.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Boom - Magic Color Change!",
          style: theme.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text("CAN BE CHANGED LATER IN SETTINGS"),
      ],
    );
  }

  Widget _buildColorSelectionIcons() {
    void onTapDownCallback(
        final List<Color> color, final TapDownDetails tapDownDetails) {
      _backgroundController.doPulse(color, tapDownDetails.globalPosition);
    }

    return WColorSelectionIcons(
      colors: colors,
      onTapDown: onTapDownCallback,
    );
  }

  Widget _buildNextButton() {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.blue),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 128.0, vertical: 16.0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3000.0))));

    return ElevatedButton(
      onPressed: () {},
      child: const Text("Next"),
      style: style,
    );
  }

  Widget _buildPageIndexIndicator() {
    const double size = 8.0;
    final Widget notCurrentIndicator = Container(
      width: size * 0.7,
      height: size * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30000.0),
        border: Border.all(color: Colors.black),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        notCurrentIndicator,
        const SizedBox(width: 4.0),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30000.0),
          ),
        ),
        const SizedBox(width: 4.0),
        notCurrentIndicator,
      ],
    );
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
