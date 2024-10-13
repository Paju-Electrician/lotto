import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          _mapView(),
          _textFieldView(),
        ],
      ),
    );
  }

  _mapView() => const NaverMap(
    useSurface: kReleaseMode,
    initLocationTrackingMode: LocationTrackingMode.Follow,
  );

  _textFieldView() => Align(
    alignment: Alignment.topCenter,
    child: SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: const TextField(
          decoration: InputDecoration.collapsed(hintText: ''),
          maxLines: 1,
        ),
      ),
    ),
  );
}