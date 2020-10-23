class ExoplanetNameModel{
  final String name;

  ExoplanetNameModel(this.name);

  factory ExoplanetNameModel.fromJson(Map<String, dynamic> json) {
    return ExoplanetNameModel(json['name']);
  }
}