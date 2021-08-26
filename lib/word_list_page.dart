import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:testing_flutter/favorite_list_page.dart';

//Set: 특정 단어 중복을 할 수가 없다.
Set<WordPair> _saved = Set<WordPair>();

class WordListPage extends StatelessWidget {
  const WordListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello My first app"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite),
            onPressed: () {
              print("click action button");
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return FavoriteListPage(_saved.toList());
              }));
          },)
        ],
      ),
      body: Center(child: RandomWords()),
    );
  }
}

// StatefulWidget: display 상태를 변화게 하는 것
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];

  @override
  //build: build안에 있는 widget을 보고 display에 배열을 해주는 작업을 한다
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //index: 현재 보고있는 item의 숫
        if(index >= words.length) {
          //generateWordPairs(): 단어들을 생성해줘라
          words.addAll(generateWordPairs().take(10));
        }
        return _getRow(words[index]);
      },
    );
  }

  Widget _getRow(WordPair wordPair) {
    //_isAlreadySaved: bool값으로 변환시킨다.
    bool _isAlreadySaved = _saved.contains(wordPair);
    //column: 위 아래로 만들어주는 방법
    return Column(
      //기본적으로 Column은 글자가 가운데로 정렬이 되어서 corssAxis같은 것을 사용해서 할 수 있다.
      crossAxisAlignment: CrossAxisAlignment.start,
      //children: 여러명의 child가 들어가는 것
      children: <Widget> [
        //padding: 간격
        ListTile(
          //onTap: 클릭하는 function
          onTap: (){
            //setState: state instance가 다시 시작이 된다. build가 다시 시작이 된다.
            setState(() {
              if(_isAlreadySaved){
                _saved.remove(wordPair);
              } else {
                _saved.add(wordPair);
              }
            });
            print(_saved.toString());
          },
          title: Text(
            wordPair.asCamelCase,
            //textScaleFactor: 1.8,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            //_isAlreadySaved ?  : = if(_isAlreadySaved) else {}
            _isAlreadySaved ? Icons.favorite: Icons.favorite_border,
            color: _isAlreadySaved ? Colors.redAccent : Colors.grey,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 5,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
