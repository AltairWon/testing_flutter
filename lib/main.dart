import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:testing_flutter/word_list_page.dart';

//main function은 무조건 있어야 한다
//runApp으로 시작을 한다.
void main() {
  runApp(MyApp());
}

//StatelessWidget = display 상태 변화가 없는
class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    //building 하는데 필요한 부분이 있다.
    return MaterialApp(
      //어떻게 자리를 잡게 만들것인가
      home: WordListPage(),
    );
  }
}
