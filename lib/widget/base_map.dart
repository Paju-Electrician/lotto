import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lotto/provider/allpages_Provider.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:provider/provider.dart';

class BaseMapPage extends StatefulWidget {
  const BaseMapPage({Key? key}) : super(key: key);

  @override
  _BaseMapPageState createState() => _BaseMapPageState();
}

class _BaseMapPageState extends State<BaseMapPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final MapType _mapType = MapType.Basic;
  final LocationTrackingMode _trackingMode = LocationTrackingMode.NoFollow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NaverMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(35.8, 127.6),
            zoom: 5,
          ),
          onMapCreated: onMapCreated,
          mapType: _mapType,
          initLocationTrackingMode: _trackingMode,
          locationButtonEnable: false,
          indoorEnable: true,
          markers: context.watch<Mainpage_Store>().markers,
        ),
      ],
    );
  }

  /// 지도 생성 완료시
  void onMapCreated(NaverMapController controller) {
    // if (widget.controller.isCompleted) widget.controller= Completer();
    if (context.read<Mainpage_Store>().abc.isCompleted) {
      context.read<Mainpage_Store>().abc = Completer();
    }
    // widget.controller.complete(controller);
    context.read<Mainpage_Store>().abc.complete(controller);
  }
}
