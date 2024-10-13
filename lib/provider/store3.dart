import 'dart:convert';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class firstLotto extends ChangeNotifier {


  var firstLottoNumNaver = [];

  getFirstLottoNaver() async {

    var naverResult = await http.get(Uri.parse('https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=로또당첨번호'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
    );

    var responseBody = utf8.decode(naverResult.bodyBytes);

    BeautifulSoup bs = BeautifulSoup(responseBody);

    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
      )!.getText()));

    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
     )!.nextElement!.getText()));

    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
   )!.nextElement!.nextElement!.getText()));
    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
   )!.nextElement!.nextElement!.nextElement!.getText()));
    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
     )!.nextElement!.nextElement!.nextElement!.nextElement!.getText()));
    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.findFirstAny(
     )!.nextElement!.nextElement!.nextElement!.nextElement!.nextElement!.getText()));



    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type1')!.getText()));
    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type1')!.findNextSibling("span")!.getText()));
    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type2')!.getText()));
    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type3')!.getText()));
    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type4')!.getText()));
    // firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'winning_number')!.find(
    //     'span', class_: 'ball type4')!.findNextSibling("span")!.getText()));
    //

    firstLottoNumNaver.add(int.parse(bs.find('div', class_: 'bonus_number')!.find(
        'span')!.getText()));
    firstLottoNumNaver.add(bs.find('p', class_: 'win_text')!.getText().split('수')[1].split('개')[0].trim());
    firstLottoNumNaver.add(bs.find('p', class_: 'win_text')!.find(
        'strong', class_: 'emphasis')!.getText());

    firstLottoNumNaver.add(bs.find('a', class_: 'text _select_trigger _text')!.getText().split('차')[0]);
    firstLottoNumNaver.add(bs.find('a', class_: 'text _select_trigger _text')!.getText().split('차')[1].split('(')[1].split(')')[0]);
    firstLottoNumNaver.add(int.parse(bs.find('a', class_: 'text _select_trigger _text')!.getText().split('회차')[0]));


    // print(firstLottoNumNaver);
      notifyListeners();
  }





















}
