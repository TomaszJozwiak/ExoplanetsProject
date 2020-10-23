import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailsPage extends StatefulWidget {
  DetailsPage({this.list, this.isFavorite});
  final List<String> list;
  bool isFavorite;
  _DetailsStage createState() => _DetailsStage();
}

class _DetailsStage extends State<DetailsPage> {

  List<String> _favList = new List<String>();

  void initState() {
    super.initState();
    _loadFavList();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Softnauts Project"),
          centerTitle: true),
      body: Center(
        child: Column(
          children: <Widget>[
            for (var string in widget.list) Text(string, textAlign: TextAlign.center),
            FlatButton(
              onPressed: (_setFavorite),
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: widget.isFavorite ?
                <Widget>[
                  Icon(Icons.favorite_outlined, color: Colors.red),
                  Text("favorite")
                ] : <Widget>[
                  Icon(Icons.favorite_outline_rounded, color: Colors.red),
                  Text("favorite")
                ],
              ),
            ),
          ],
        ),
      ),
      );
  }

  _loadFavList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getStringList('favorite') != null){
      _favList = (prefs.getStringList('favorite'));
      }
    });
  }



  _setFavorite() async {
  //  Favorite favorite = Favorite();
  //  favorite.setList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (widget.isFavorite) {
        _favList.remove(widget.list.first);
        prefs.setStringList('favorite', _favList);
        widget.isFavorite = false;
      } else {
        _favList.add(widget.list.first);
        prefs.setStringList('favorite', _favList);
        widget.isFavorite = true;
      }
    });
  }

}
