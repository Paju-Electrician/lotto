import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'ad_number.dart';

class button15Page extends StatefulWidget {
  const button15Page({super.key});

  @override
  State<button15Page> createState() => _button15PageState();
}

class _button15PageState extends State<button15Page> {
  List<Map<String, String>> _newsList = [];
  Future<List<Map<String, String>>>? _newsFuture;
  int _page = 1; // 페이지 번호
  bool _isLoading = false; // 로딩 상태
  bool _hasMore = true; // 더 불러올 뉴스가 있는지 여부

  @override
  void initState() {
    super.initState();
    banner = BannerAd(
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load: $error');
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) => print('Ad opened.'),
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) => print('Ad closed.'),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) => print('Ad impression.'),
        ),
        size: AdSize.banner,
        adUnitId: androidTestUnitId,
        request: const AdRequest())
      ..load();
    _loadNews(); // 초기 뉴스 로드
  }

  Future<void> _loadNews() async {
    if (_isLoading || !_hasMore) return; // 이미 로딩 중이거나 더 이상 로드할 뉴스가 없음
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://openapi.naver.com/v1/search/news.json?query=로또&display=100&start=${_page * 100 - 99}');
    final response = await http.get(
      url,
      headers: {
        'X-Naver-Client-Id': 'sd1Sb3ZHNvJE_TEP9TmA',
        'X-Naver-Client-Secret': 'ZfVsLgt576',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newsList = data['items'] as List;

      if (newsList.isEmpty) {
        _hasMore = false; // 더 이상 뉴스가 없으면 플래그 설정
      } else {
        List<String> excludeKeywords = [
          // 제외 키워드 리스트
          "흔들리는 서노송예술촌", "축제", "개소리", "개막", "김소원", "경북도의회", "청송사과축제", "청약","신축","진출","특공","신인",
          "차에서", "경북24시", "국밥", "이순재", "민주당", "김경필", "의대", "청송군", "신임",
          "예출촌", "백미", "미스터로또", "분양", "검찰", "산업재해", "부동산", "별자리", "집값",
          "청약", "미분양", "운세", "아파트", "로또아파트", "예술축전", "지방", "주택", "금리", "산업방송", "청송사과", "골프", "솔로", "홀인원", "이혼", "체험기", "진해성",
        ];

        // 새 뉴스 추가
        _newsList.addAll(newsList
            .map((news) => {
          'title': news['title']
              .toString()
              .replaceAll(RegExp(r'<[^>]*>'), '') // HTML 태그 제거
              .replaceAll('&quot;', '"')
              .replaceAll('&lt;', '<')
              .replaceAll('&gt;', '>'),
          'thumbnail': news['thumbnail']?.toString() ?? '', // 썸네일 필드 사용
          'pubDate': news['pubDate']?.toString() ?? '알 수 없음', // 발행일 추가
          'link': news['link']?.toString() ?? '' // 링크 추가
        })
            .where((news) =>
        news['title']!.contains('로또') && // 제목에 "로또" 포함 여부 필터
            !excludeKeywords.any((keyword) => news['title']!.contains(keyword)))
            .toList());

        _page++; // 페이지 번호 증가
      }
    } else {
      throw Exception('Failed to load news');
    }

    setState(() {
      _isLoading = false;
    });
  }

  // 발행 시간을 포맷하는 함수
  String formatPublishDate(String pubDate) {
    try {
      DateTime dateTime = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US').parse(pubDate);
      return DateFormat('yyyy년 MM월 dd일 EEEE', 'ko_KR').format(dateTime);
    } catch (e) {
      return '알 수 없음'; // 오류 발생 시 기본 메시지
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AutoSizeText("로또 뉴스 모아보기", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: 'Pretendard'))),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          // 스크롤이 하단에 도달했을 때 추가 뉴스 로드
          if (!scrollInfo.metrics.atEdge || _isLoading) return false; // 이미 로딩 중이거나 최하단이 아님
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _loadNews();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _newsList.length + (_isLoading ? 1 : 0), // 로딩 아이콘을 추가
          itemBuilder: (context, index) {
            if (index == _newsList.length) {
              return Center(child: CircularProgressIndicator()); // 로딩 중 아이콘
            }

            final news = _newsList[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Color(0xfff8f8f8), // 카드 배경색
              child: InkWell(
                onTap: () {
                  final link = news['link'];
                  if (link != null && link.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(link: link),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("뉴스 링크가 없습니다.")),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 세로 정렬
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                        child: Image.network(
                          news['thumbnail'] ?? '', // 썸네일 URL
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover, // 비율 유지
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 30,
                              height: 30,
                              color: Colors.grey[300], // 오류 시 기본 색상
                              child: Image.asset(
                                'assets/news.png', // 로컬 이미지 파일 경로
                                fit: BoxFit.cover, // 비율 유지
                              ), // 오류 아이콘
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 16), // 이미지와 텍스트 간격
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              news['title'] ?? '제목 없음',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            AutoSizeText(
                              '링크: ${news['link']?.toString() ?? ''}',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            AutoSizeText(
                              '발행 시간: ${news['pubDate'] ?? '알 수 없음'}', // 발행 시간을 추가하세요.
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(child: returnAd())
    );
  }

  @override
  void dispose() {
    banner?.dispose(); // 배너 해제
    super.dispose();
  }
}
class NewsDetailPage extends StatefulWidget {
  final String link;

  NewsDetailPage({required this.link});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AutoSizeText("로또 뉴스 모아보기",style: TextStyle(fontWeight: FontWeight.normal,fontFamily:'Pretendard'),)),
      body: WebViewWidget(controller: _controller),
    );
  }
}
