import 'dart:convert';
import 'dart:core';
import 'package:flutter_weatherapi/ExoplanetNameModel.dart';
import 'package:http/http.dart' as http;
import 'ExoplanetNameModel.dart';

class ExoplanetNameRepository {
  var names = List<ExoplanetNameModel>();
  String link = "https://api.arcsecond.io/exoplanets/?format=json";

  Future<List<ExoplanetNameModel>> getExoplanetNames() async {
    if (link != null) {
      final result = await http.Client().get(link);

      if (result.statusCode != 200) throw Exception();

      updateLink(result.body);
      parsedJson(result.body);
    }

    return names;
  }

  void parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonExoplanets = jsonDecoded["results"];

    for (var jsonName in jsonExoplanets) {
      names.add(ExoplanetNameModel.fromJson(jsonName));
    }
  }

  void updateLink(final response) {
    this.link = json.decode(response)["next"];
  }
}
