class Activity {
  final String pk;
  final String date;
  final String profile_pk;
  final String profile_first_name;
  final String profile_last_name;
  final String profile_username;
  final String profile_membership_date;
  final String observing_site_uuid;
  final String observing_site_name;
  final String observing_site_nickname;
  final String observing_site_alternate_names;
  final String observing_site_IAUCode;
  final String observing_site_acronym;
  final String observing_site_homepage_url;
  final String observing_site_coordinates_longitude;
  final String observing_site_coordinates_latitude;
  final String observing_site_coordinates_height;
  final String address_line_1;
  final String address_line_2;
  final String address_zip_code;
  final String address_state_province;
  final String address_country;
  final String address_time_zone_id;
  final String address_time_zone_name;
  final String address_time_zone_offset;
  final String address_continent;
  final String telescopes;
  final String images;
  final String is_active;
  final String action;
  final String property_name;
  final String old_value;
  final String new_value;
  final String action_message;
  final String method;

  Activity({
    this.pk,
    this.date,
    this.profile_pk,
    this.profile_first_name,
    this.profile_last_name,
    this.profile_username,
    this.profile_membership_date,
    this.observing_site_uuid,
    this.observing_site_name,
    this.observing_site_nickname,
    this.observing_site_alternate_names,
    this.observing_site_IAUCode,
    this.observing_site_acronym,
    this.observing_site_homepage_url,
    this.observing_site_coordinates_longitude,
    this.observing_site_coordinates_latitude,
    this.observing_site_coordinates_height,
    this.address_line_1,
    this.address_line_2,
    this.address_zip_code,
    this.address_state_province,
    this.address_country,
    this.address_time_zone_id,
    this.address_time_zone_name,
    this.address_time_zone_offset,
    this.address_continent,
    this.telescopes,
    this.images,
    this.is_active,
    this.action,
    this.property_name,
    this.old_value,
    this.new_value,
    this.action_message,
    this.method
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> profileMap = json["profile"];
    Map<String, dynamic> observingSiteMap = json["observing_site"];
    Map<String, dynamic> coordinatesMap = observingSiteMap["coordinates"];
    Map<String, dynamic> addressMap = observingSiteMap["address"];

    return Activity(
    pk: json["pk"].toString(),
    date: json["date"],
    profile_pk: profileMap["pk"].toString(),
    profile_first_name: profileMap["first_name"],
    profile_last_name: profileMap["last_name"],
    profile_username: profileMap["username"],
    profile_membership_date: profileMap["membership_date"],
    observing_site_uuid: observingSiteMap["uuid"],
    observing_site_name: observingSiteMap["name"],
    observing_site_nickname: observingSiteMap["nickname"],
    observing_site_alternate_names: observingSiteMap["alternate_names"],
    observing_site_IAUCode: observingSiteMap["IAUCode"],
    observing_site_acronym: observingSiteMap["acronym"],
    observing_site_homepage_url: observingSiteMap["homepage_url"],
    observing_site_coordinates_longitude: coordinatesMap["longitude"].toString(),
    observing_site_coordinates_latitude: coordinatesMap["latitude"].toString(),
    observing_site_coordinates_height: coordinatesMap["height"].toString(),
    address_line_1: addressMap["line_1"],
    address_line_2: addressMap["line_2"],
    address_zip_code: addressMap["zip_code"],
    address_state_province: addressMap["state_province"],
    address_country: addressMap["country"],
    address_time_zone_id: addressMap["time_zone_id"],
    address_time_zone_name: addressMap["time_zone_name"],
    address_time_zone_offset: addressMap["time_zone_offset"].toString(),
    address_continent: addressMap["continent"],
    telescopes: observingSiteMap["telescopes"].toString(),
    images: observingSiteMap["images"].toString(),
    is_active: observingSiteMap["is_active"].toString(),
    action: json["action"],
    property_name: json["property_name"],
    old_value: json["old_value"],
    new_value: json["new_value"],
    action_message: json["action_message"],
    method: json["method"],
    );
  }
}