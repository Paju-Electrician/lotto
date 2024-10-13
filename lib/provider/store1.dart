import 'dart:async';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto/pages/button1Page.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'dart:convert';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:cp949/cp949.dart' as cp949;

class Store1 extends ChangeNotifier {
  Map<dynamic, dynamic> lottoData = {};
  Map<dynamic, dynamic> placeLottoData = {};

  /*메인페이지 상단에 로또회차에 의한 번호정보만 담겨질것*/
  var lottoRoundStandard = 1007;
  var lottoRound = 1007;
  var placeLottoRound = 1007;
  List<dynamic> totalLottoData = [];

  /*역대 모든 로또번호 정보 */
  var but1One;
  var MarkerWhere = [];
  List<Marker> markers = [];

  Map<dynamic, dynamic> button2RoundInfo = {};

  firstRound() async {
    /*갱신된 로또라운드로 로또번호를 받아온다 */
    lottoRoundis();
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    Map DataList = jsonDecode(result.body);
    changelottoData(DataList);
    button2pageMake(DataList);
    // notifyListeners();
  }

  lottoRoundis() {
    /*앱 제일 먼저 실행해주는 함수 로또라운드 갱신 해준다 */
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    DateTime now = tz.TZDateTime.now(tz.local);
    DateTime dateTime1 = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    DateTime dateTime2 = DateTime(2022, 3, 19, 21, 00);
    Duration duration = dateTime2.difference(dateTime1);
    int dur = duration.inDays.abs() ~/ 7;
    lottoRound = lottoRound + dur;
    placeLottoRound = placeLottoRound + dur;
  }

  button2pageMake(Map<dynamic, dynamic> a) {
    button2RoundInfo = a;
  }

  changelottoData(Map<dynamic, dynamic> a) {
    lottoData = a;
  }


  getTotalLottoData() async {
    /*갱신된 로또라운드 만큼 전체 로또번호를 받아온다 */
    for (int i = lottoRound; i > 0; i--) {
      var result = await http.get(Uri.parse(
          'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$i'));
      Map totalDataList = jsonDecode(result.body);
      totalLottoData.add(totalDataList);
    }
     notifyListeners();
  }

  getbut1one() async {
    /*버튼1페이지에서 로딩에 생기지 않도록 최초정보를 담기위한 함수*/
    var result = await fetchPost(lottoRound);
    but1One = result;
    // notifyListeners();
  }

  changeRoundPlus() async {
    lottoRound++;
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    if (result.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      Map DataList = jsonDecode(result.body);
      changelottoData(DataList);
      notifyListeners();
    } else {

      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');

    }
  }


  changeRoundMinus() async {
    lottoRound--;
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    Map DataList = jsonDecode(result.body);
    changelottoData(DataList);
    notifyListeners();
  }

  var firstLottoPlace = [];
  var firstLottoPlaceSet = [];
  var map = <String, dynamic>{};
  var firstWay = [];

  getFirstLottoPlace() async {
    map['drwNo'] = '${lottoData['drwNo']}';
    var placeResponse = await http.post(
        Uri.parse(
            'https://dhlottery.co.kr/store.do?method=topStore&pageGubun=L645'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map);
    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);
    firstLottoPlace = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .getText()
        .replaceAll('\n', '')
        .replaceAll('\t', '')
        .replaceAll('  ', '')
        .split('지도보기');

    for (int i = 0; i < firstLottoPlace.length; i++) {
      firstLottoPlace[i] =
          firstLottoPlace[i].replaceFirst('${i + 1}', '').trim();
      var a;
      if (firstLottoPlace[i].contains('수동')) {
        firstWay.add('수동');
        a = firstLottoPlace[i].split('수동');
      } else if (firstLottoPlace[i].contains('자동')) {
        if (firstLottoPlace[i].contains('반자동')) {
          firstWay.add('반자동');
          a = firstLottoPlace[i].split('반자동');
        } else {
          firstWay.add('자동');
          a = firstLottoPlace[i].split('자동');
        }
      }

      firstLottoPlaceSet.add(a);
    }
    firstLottoPlaceWhere();
    // notifyListeners();
  }

  changePlaceLottoData(Map<dynamic, dynamic> a) {
    placeLottoData = a;
    notifyListeners();
  }

  placePlus() async {
    placeLottoRound++;
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$placeLottoRound'));
    Map DataList = jsonDecode(result.body);
    changePlaceLottoData(DataList);
    notifyListeners();

    map['drwNo'] = '${placeLottoData['drwNo']}';

    var placeResponse = await http.post(
        Uri.parse(
            'https://dhlottery.co.kr/store.do?method=topStore&pageGubun=L645'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map);

    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);

    firstLottoPlace.clear();
    firstWay.clear();

    firstLottoPlace = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .getText()
        .replaceAll('\n', '')
        .replaceAll('\t', '')
        .replaceAll('  ', '')
        .split('지도보기');
    firstLottoPlaceSet.clear();
    for (int i = 0; i < firstLottoPlace.length; i++) {
      //
      firstLottoPlace[i] =
          firstLottoPlace[i].replaceFirst('${i + 1}', '').trim();
      var a;
      if (firstLottoPlace[i].contains('수동')) {
        firstWay.add('수동');
        a = firstLottoPlace[i].split('수동');
      } else if (firstLottoPlace[i].contains('자동')) {
        if (firstLottoPlace[i].contains('반자동')) {
          firstWay.add('반자동');
          a = firstLottoPlace[i].split('반자동');
        } else {
          firstWay.add('자동');
          a = firstLottoPlace[i].split('자동');
        }
      }

      firstLottoPlaceSet.add(a);
    }
    ChageLottoPlace();

    notifyListeners();
  }

  placeMinus() async {
    placeLottoRound--;
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$placeLottoRound'));
    Map DataList = jsonDecode(result.body);
    changePlaceLottoData(DataList);
    notifyListeners();

    map['drwNo'] = '${placeLottoData['drwNo']}';
    var placeResponse = await http.post(
        Uri.parse(
            'https://dhlottery.co.kr/store.do?method=topStore&pageGubun=L645'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map);

    var responseBody = cp949.decode(placeResponse.bodyBytes);
    BeautifulSoup bs = BeautifulSoup(responseBody);

    firstLottoPlace.clear();
    firstWay.clear();
    firstLottoPlace = bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .getText()
        .replaceAll('\n', '')
        .replaceAll('\t', '')
        .replaceAll('  ', '')
        .split('지도보기');
    firstLottoPlaceSet.clear();
    for (int i = 0; i < firstLottoPlace.length; i++) {
      //
      firstLottoPlace[i] =
          firstLottoPlace[i].replaceFirst('${i + 1}', '').trim();
      var a;
      if (firstLottoPlace[i].contains('수동')) {
        firstWay.add('수동');
        a = firstLottoPlace[i].split('수동');
      } else if (firstLottoPlace[i].contains('자동')) {
        if (firstLottoPlace[i].contains('반자동')) {
          firstWay.add('반자동');
          a = firstLottoPlace[i].split('반자동');
        } else {
          firstWay.add('자동');
          a = firstLottoPlace[i].split('자동');
        }
      }

      firstLottoPlaceSet.add(a);
    }
    ChageLottoPlace();

    notifyListeners();
  }

  firstLottoPlaceWhere() async {
    for (int i = 0; i < firstLottoPlaceSet.length - 1; i++) {
      var add = '${firstLottoPlaceSet[i][1].trim()}';
      if (add.contains('동행복권')) {
        add = '서울 서초구 남부순환로 2423';
      }
      var headerss = <String, String>{};
      headerss['X-NCP-APIGW-API-KEY-ID'] = 'qrj5gubj5k';
      headerss['X-NCP-APIGW-API-KEY'] =
      '72tgrH1uvwUDaoaegnpzmnFySQ2nPJskXrmaEm3q';
      final PlaceNumResponse = await http.get(
          Uri.parse(
              'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$add'),
          headers: headerss);

      var res = jsonDecode(PlaceNumResponse.body);
      var numwhere = [];
      numwhere.add(double.parse(res['addresses'][0]['x']));

      numwhere.add(double.parse(res['addresses'][0]['y']));

      MarkerWhere.add(numwhere);
    }
    notifyListeners();

    firstMarker();
  }

  ChageLottoPlace() async {
    MarkerWhere.clear();
    for (int i = 0; i < firstLottoPlaceSet.length - 1; i++) {
      var add = '${firstLottoPlaceSet[i][1].trim()}';
      if (add.contains('동행복권')) {
        add = '서울 서초구 남부순환로 2423';
      }
      var headerss = <String, String>{};
      headerss['X-NCP-APIGW-API-KEY-ID'] = 'qrj5gubj5k';
      headerss['X-NCP-APIGW-API-KEY'] =
      '72tgrH1uvwUDaoaegnpzmnFySQ2nPJskXrmaEm3q';
      final PlaceNumResponse = await http.get(
          Uri.parse(
              'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$add'),
          headers: headerss);

      var res = jsonDecode(PlaceNumResponse.body);
      var numwhere = [];
      numwhere.add(double.parse(res['addresses'][0]['x']));

      numwhere.add(double.parse(res['addresses'][0]['y']));

      MarkerWhere.add(numwhere);
    }
    notifyListeners();

    changeMarker();
  }

  Completer<NaverMapController> abc = Completer();

  firstMarker() async {
    for (int i = 0; i < MarkerWhere.length; i++) {
      markers.add(Marker(
          markerId: '${i}1',
          // position: LatLng(35, 127),
          position: LatLng(MarkerWhere[i][1], MarkerWhere[i][0]),
          captionText: "${firstLottoPlaceSet[i][0].trim()}",
          captionColor: Colors.indigo[900],
          captionTextSize: 12.0,
          alpha: 1,
          captionOffset: 30,
          anchor: AnchorPoint(0.5, 1),
          width: 20,
          height: 30,
          infoWindow: "${firstLottoPlaceSet[i][1].trim()}",
          onMarkerTab: _onMarkerTap));
    } // infoWindow: "${firstLottoPlaceSet[i][0].trim()}",

    notifyListeners();
  }

  changeMarker() async {
    markers.clear();
    for (int i = 0; i < MarkerWhere.length; i++) {
      markers.add(Marker(
          markerId: '${i}1',
          // position: LatLng(35, 127),
          position: LatLng(MarkerWhere[i][1], MarkerWhere[i][0]),
          captionText: "${firstLottoPlaceSet[i][0].trim()}",
          captionColor: Colors.indigo[900],
          captionTextSize: 12.0,
          alpha: 1,
          captionOffset: 10,
          anchor: AnchorPoint(0.5, 1),
          width: 20,
          height: 30,
          infoWindow: "${firstLottoPlaceSet[i][1].trim()}",
          onMarkerTab: _onMarkerTap)
      );
    } // infoWindow: "${firstLottoPlaceSet[i][0].trim()}",

    notifyListeners();
  }

 void _onMarkerTap(Marker? marker, Map<String, int?> iconSize) async {
    NaverMapController naver = await abc.future;

    var cameraUpdate = CameraUpdate.toCameraPosition(CameraPosition(
      target: LatLng(marker!.position.latitude, marker.position.longitude),
      zoom: 10.0,
    ));

    naver.moveCamera(cameraUpdate);
  }



  List saveNumberList = [];


/////////////////////////////////button7page 만들자
//   var totalNewDataList;
//
//   getTotalNewLottoData() async {
//     /*갱신된 로또라운드 만큼 전체 로또번호를 받아온다 */
//
//     var result = await http.get(Uri.parse(
//         'https://smok95.github.io/lotto/results/all.json'));
//     totalNewDataList = jsonDecode(result.body);
//     print(totalNewDataList.runtimeType);
//     print(totalNewDataList);
//     // notifyListeners();
//   }


}

