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

class Mainpage_Store extends ChangeNotifier {
  /*메인페이지 상단에 로또회차에 의한 번호정보만 담겨질것*/
  var lottoRound = 1007;

  /*앱 제일 먼저 실행 해주는 함수 로또라운드가 몇회차인지 현재날짜기준으로 갱신 해준다 */
  lottoRoundis() {
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

    /*메인페이지에서 동행복권에서 가져오는 최신로또번호 저장*/
  Map<dynamic, dynamic> lottoData = {};

  /*메인페이지에서 동행복권에서 가져오는 최신로또번호 정보를 저장 하는 함수*/
  changelottoData(Map<dynamic, dynamic> a) {
    lottoData = a;
  }

  /*메인페이지에서 동행복권에서 lottoRound에 따른 정보를 가져오고 lottoData에 저장하는 함수 실행*/
  firstRound() async {
    /*갱신된 로또라운드로 로또번호를 받아온다 */
    // lottoRoundis();
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    Map DataList = jsonDecode(result.body);
    changelottoData(DataList);
    // button5pageMake(DataList);
    // notifyListeners();
  }



  /*메인페이지에서 동행복권에서 lottoRound에 1을 더하고,그 값에 따른 정보를 가져오고 lottoData에 저장하는 함수 실행*/
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

  /*메인페이지에서 동행복권에서 lottoRound에 1을 빼고,그 값에 따른 정보를 가져오고 lottoData에 저장하는 함수 실행*/
  changeRoundMinus() async {
    lottoRound--;
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    Map DataList = jsonDecode(result.body);
    changelottoData(DataList);
    notifyListeners();
  }

    /*button1Page에서 회차에 따른 모든 당첨인원수와 상금 정보 */
  var peoplemoney;

  /*button1Page에서 로딩에 생기지 않도록 당첨인원수와 상금 최초정보를 담기위한 함수*/
  peoplemoneyMake() async {
    var result = await fetchPost(lottoRound);
    peoplemoney = result;
    // notifyListeners();
  }

  /*button1Page에서 회차i에 따라서 동행복권에서 당첨인원수와 상금을 가져오는 함수*/
  Future<List<LottoWeb>> fetchPost(i) async {
    List<LottoWeb> LottoWebData =
        []; /*동행복권에서 당첨인원수와 상금을 가져와서 String을 LottoWeb으로 변환해서 최종 담는다*/
    List<String> rawWebData = []; /*동행복권에서 당첨인원수와 상금을 String으로 담는다*/

    var map = <String, dynamic>{};

    map['drwNo'] = i.toString();
    map['drwNoList'] = i.toString();
    final response = await http.get(
        Uri.parse('https://dhlottery.co.kr/gameResult.do?method=byWin'),
        headers: {'Content-Type': 'application/json'});
    final postResponse = await http.post(
        Uri.parse('https://dhlottery.co.kr/gameResult.do?method=byWin'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map);

    var responseBody = cp949.decode(postResponse.bodyBytes);

    BeautifulSoup bs = BeautifulSoup(responseBody);

    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .findNextSibling('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());
    rawWebData.add(bs
        .find('table', class_: 'tbl_data tbl_data_col')!
        .find('tbody')!
        .find('tr')!
        .find('td', class_: 'tar')!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .findNextSibling("td")!
        .getText());

    LottoWebData.add(LottoWeb(
        lotto1People: rawWebData[0],
        lotto1Amount: rawWebData[1],
        lotto2People: rawWebData[2],
        lotto2Amount: rawWebData[3],
        lotto3People: rawWebData[4],
        lotto3Amount: rawWebData[5],
        lotto4People: rawWebData[6],
        lotto4Amount: rawWebData[7],
        lotto5People: rawWebData[8],
        lotto5Amount: rawWebData[9],
        lottoWay: rawWebData[10]));

    if (response.statusCode == 200) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.

      return LottoWebData;
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      print('서버요청실패');
      throw Exception('Failed to load post');
    }
  }

  /*button1Page에서 동행복권에 있는 1회차부터 모든 갱신된 로또라운드까지 전체 로또번호 정보 */
  List<dynamic> totalLottoData = [];

  /*button1Page에서 동행복권에 있는 1회차부터 모든 갱신된 로또라운드까지 전체 로또번호를 받아온다 */
  getTotalLottoData() async {
    for (int i = lottoRound; i > 0; i--) {
      var result = await http.get(Uri.parse(
          'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$i'));
      Map totalDataList = jsonDecode(result.body);
      totalLottoData.add(totalDataList);
    }
    notifyListeners();
  }

  /*button3Page에서 동행복권에서 가져오는 최신로또번호 저장 (네이버지도용 )*/
  Map<dynamic, dynamic> placeLottoData = {};

  /*button3Page에서  상단에 로또회차에 의한 번호정보만 담겨질것(네이버지도용 )*/
  var placeLottoRound = 1007;

  /*button3Page에서 동행복권 1등당첨장소 정보(네이버지도용 )  */
  var firstLottoPlace = [];

  /*button3Page에서 동행복권 1등당첨장소 정보 세트 (네이버지도용 )*/
  var firstLottoPlaceSet = [];

  var map = <String, dynamic>{};
  var firstWay = [];

    /*button3Page에서 동행복권 1등당첨장소 정보 불러오는 함수(네이버지도용 ) */
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

  /*button3Page에서 네이버지도 마커용 */
  var MarkerWhere = [];
  List<Marker> markers = [];

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
          onMarkerTab: _onMarkerTap));
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

  /*button5Page에서 동행복권에서 lottoRound에 따른 정보를 가져오고 button5pageMake에 저장하는 함수 실행 */
  button5pageInfoSave() async {
    // /*갱신된 로또라운드로 로또번호를 받아온다 */
    // lottoRoundis();
    var result = await http.get(Uri.parse(
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$lottoRound'));
    Map DataList = jsonDecode(result.body);
    // changelottoData(DataList);
    button5pageMake(DataList);
    // notifyListeners();
  }

  /*button5Page에서 동행복권에서 lottoRound에 따른 정보*/
  Map<dynamic, dynamic> button5RoundInfo = {};

  /*button5Page에서 동행복권에서 lottoRound에 따른 정보 저장 하는 함수*/
  button5pageMake(Map<dynamic, dynamic> a) {
    button5RoundInfo = a;
  }

  // List saveNumberList = [];

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
