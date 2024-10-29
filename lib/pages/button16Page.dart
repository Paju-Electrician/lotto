import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class button16Page extends StatefulWidget {
  @override
  State<button16Page> createState() => _button16PageState();
}

class _button16PageState extends State<button16Page> {
  final List<Map<String, String>> channels = [
    {
      'title': '로또 당첨 전략',
      'videoId': 'AfRUC571mkA',
    },
    {
      'title': '로또 분석 영상',
      'videoId': 'abcdef12345', // 예시 비디오 ID, 실제 비디오 ID로 변경 필요
    },
    // 추가 채널 정보...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로또 분석 채널')),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 열 수
          childAspectRatio: 1, // 가로 세로 비율
          crossAxisSpacing: 8.0, // 열 간격
          mainAxisSpacing: 8.0, // 행 간격
        ),
        itemCount: channels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final videoId = channels[index]['videoId']!;
              final url = 'https://www.youtube.com/watch?v=$videoId'; // 비디오 ID로 URL 생성
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              child: Center(
                child: Text(
                  channels[index]['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
