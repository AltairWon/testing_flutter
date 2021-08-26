import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {

  //저장된 favorites 데이터를 저장할려고 하는 리스트 생성
  //final: class의 instance가 생성되자마자 이 부분이 설정이 되지 않으면, 여기에다가 어떤 데이터를 지정해줘라
  final List<WordPair> favorites;

  const FavoriteListPage(this.favorites, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Page"),
      ),
      //separated: separatorBuilder랑 itemCount를 넣어줘야 한다.
      body: ListView.separated(itemBuilder: (context, index){
        return ListTile(
          title: Text(
            favorites[index].asCamelCase,
            //textScaleFactor: 1.8,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      }, //itemCount: item안에 몇개의 list를 넣어줄 것인가
         //separatorBuilder: Divider의 역할을 사용
        //index의 따라서 색깔을 변경할 수 있고 나눠지는 부분을 다르게 할 수 있는데 그때 사용하는 것
        itemCount: favorites.length, separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            color: Colors.grey[300],
            height: 5,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}
