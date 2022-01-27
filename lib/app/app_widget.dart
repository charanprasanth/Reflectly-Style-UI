import 'package:flutter/material.dart';
import 'package:reflectly/color_selection_page/color_selection_page_widget.dart';

class WApp extends StatefulWidget {
  const WApp({Key? key}) : super(key: key);

  @override
  _WAppState createState() => _WAppState();
}

class _WAppState extends State<WApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WColorSelectionPage(),
    );
  }
}
