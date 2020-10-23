import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapi/Activity.dart';
import 'package:flutter_weatherapi/ActivityRepository.dart';
import 'package:flutter_weatherapi/Utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DetailsPage.dart';


class ActivitiesPage extends StatefulWidget {
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<ActivitiesPage> {
  List<Activity> _activities;
  List<String> _favList = new List<String>();
  ActivityRepository activityRepository =
  new ActivityRepository();
  ScrollController _scrollController;

  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadFavList();
    activityRepository.getActivities().then((activities) {
      setState(() {
        _activities = activities;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        Activity activity = _activities[index];
        return Card(
            child: ListTile(
              leading: _isFavorite(activity.pk)? Icon(Icons.favorite, size: 32, color: Colors.red) : Icon(Icons.favorite_border, size: 32, color: Colors.red),
              title: Text(
                  activity.profile_username),
              subtitle: Text(
                  activity.observing_site_name,
                  overflow: TextOverflow.ellipsis
              ),
              trailing: Text(
                  (activity.date).substring(0, 10)
              ),
              onTap: () => _showDetails(activity),
            )
        );
      },
      itemCount: null == _activities ? 0 : _activities.length,
      controller: _scrollController,
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

  _showDetails(Activity activity) {
    List<String> list = Utility().createList(activity);
    setState(() {
      bool isFavorite = _isFavorite(activity.pk);
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(list: list, isFavorite: isFavorite,))).then((value) => setState(() => { _loadFavList() }));
    });
  }

  _isFavorite(String word) {
    for (var string in _favList) {
      if (string == word) {
        return true;
      }
    }
    return false;
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      activityRepository.getActivities().then((activities) {
        setState(() {
          _activities = activities;
        });
      });
    }
  }
}