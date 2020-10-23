import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapi/ExoplanetNameModel.dart';
import 'package:flutter_weatherapi/ExoplanetNameRepository.dart';

class ExoplanetsPage extends StatefulWidget {
  _ExoplanetsState createState() => _ExoplanetsState();
}

class _ExoplanetsState extends State<ExoplanetsPage> {
  List<ExoplanetNameModel> _exoplanetNames;
  List<ExoplanetNameModel> _exoplanetNamesForDisplay = List<ExoplanetNameModel>();
  ExoplanetNameRepository exoplanetNameRepository =
      new ExoplanetNameRepository();
  ScrollController _scrollController;

  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    exoplanetNameRepository.getExoplanetNames().then((names) {
      setState(() {
        _exoplanetNames = names;
        _exoplanetNamesForDisplay = _exoplanetNames;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        return

        index == 0 ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search...'
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _exoplanetNamesForDisplay = _exoplanetNames.where((exoplanetName) {
                  var exoplanetNameTitle = exoplanetName.name.toLowerCase();
                  return exoplanetNameTitle.contains(text);
                }).toList();
              });
            },
          ),
        ) :

          Card(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                index.toString() + ". " + _exoplanetNamesForDisplay[index - 1].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
      },
      itemCount: null == _exoplanetNamesForDisplay ? 0 : _exoplanetNamesForDisplay.length + 1,
      controller: _scrollController,
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      exoplanetNameRepository.getExoplanetNames().then((names) {
        setState(() {
          _exoplanetNames = names;
          _exoplanetNamesForDisplay = names;
        });
      });
    }
  }
}
