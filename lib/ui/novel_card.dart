import 'package:flutter/material.dart';
import '../page/image_preview.dart';

class NovelCard {

  Widget createCard(Map mealData) {
    return _NovelCard(mealData);
  }
}

class _NovelCard extends StatelessWidget {
  final Map _novelData;

  _NovelCard(
    this._novelData,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5,right: 5, top: 5, bottom: 5),
                  color:Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
//                        color: Colors.yellow[200],
                        child: _Header(_novelData),
                      ),
                      Row(children: <Widget>[
                        Expanded(child: _Image(imageUrl:_novelData['imageUrlHttps']),),
                        Expanded(child: (
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: getFavoriteWidgets(_novelData['favorite']),
                              ),
                              Container(
//                                color: Colors.red[50],
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text("症状：" + _novelData['status']),
                              ),
                              Container(
//                                color: Colors.red[100],
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text("場所：" + _novelData['location']),
                              ),
                              Container(
//                                color: Colors.red[200],
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text("備考：" + _novelData['note']),
                              ),
                            ],
                          )
                        ),),

                      ],
                      ),

                      Container(
//                        color: Colors.blue[50],
                        margin: EdgeInsets.only(left: 5, top: 10, right:5),
                        child: Text(_novelData['text']),
                      ),

                      Container(
 //                       color: Colors.lightGreen[300],
                        child: _FooterButtons(_novelData),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getFavoriteWidgets(int argNum) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < argNum; i++) {
      list.add(new Icon(Icons.favorite,color:Colors.red));
    }
    return
      new Row(
        children: list,
        mainAxisAlignment: MainAxisAlignment.center,
      );
  }
}

class _Image extends StatelessWidget {
  final String imageUrl;
  _Image({this.imageUrl});

  final Radius _radius = Radius.circular(20.0);
  final double _imageHeight = 0.2;

  /// 画像に各種設定を行う
  /// 
  /// [url]の画像に対して以下を設定した[Container]を返却する。
  /// 指定がない場合はデフォルト値を使用。
  /// [height]、[width]、[borderRadius]、[padding]
  Widget _imageItem({
    BuildContext context,
    String url,
    double height = double.infinity,
    double width = double.infinity,
    BorderRadius borderRadius,
    EdgeInsets padding,
    }) {

    borderRadius ??= BorderRadius.all(Radius.circular(0));
    padding ??= EdgeInsets.zero;

    Image image = Image.network(
      url,
      fit:BoxFit.cover
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreview(image: image),
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: image,
        ),
      ),
    );
  }

  /// 画像1枚用のウィジェット
  Widget _image1(BuildContext context){
    final double deviceHeight = MediaQuery.of(context).size.height;
    return _imageItem(
      context: context,
      url: imageUrl,
      height: _imageHeight * deviceHeight,
      borderRadius: BorderRadius.all(_radius),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _image1(context);
  }
}

class _Header extends StatelessWidget {
  final Map _mealData;

  _Header(
    this._mealData,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            children: <Widget>[
              Text(
                _mealData['timeText'],
                style: TextStyle(
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Flexible(
                flex: 10,
                child: Text(
                  '　' + _mealData['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _FooterButtons extends StatelessWidget {
  final Map _mealData;
  _FooterButtons(
    this._mealData,
  );
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.all(0.0),
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat_bubble_outline),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(''),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.cached),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(_mealData['retweetCount'].toString()),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(_mealData['favoriteCount'].toString()),
          ],
        ),
        IconButton(
          icon: Icon(Icons.share),
          iconSize: 18.0,
          onPressed: () {},
        ),
      ],
    );
  }
}