import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'Activity.dart';

class ActivityRepository {
  var activities = List<Activity>();
  String link = "https://api.arcsecond.io/observingsites/updates/?format=json&page=1&page_size=20";

  Future<List<Activity>> getActivities() async {
    if (link != null) {
      final result = await http.Client().get(link);

      if (result.statusCode != 200) throw Exception();

      updateLink(result.body);
      parsedJson(result.body);
    }

    return activities;
  }

  void parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonExoplanets = jsonDecoded["results"];

    for (var jsonName in jsonExoplanets) {
      activities.add(Activity.fromJson(jsonName));
    }
  }

  void updateLink(final response) {
    this.link = json.decode(response)["next"];
  }
}