import 'package:flutter_weatherapi/Activity.dart';

class Utility {

  List<String> createList(Activity activity) {

    List<String> list = new List<String>();

    if (checkString(activity.pk)) list.add(activity.pk);
    if (checkString(activity.date)) list.add("Date: " + activity.date);
    if (checkString(activity.profile_pk)) list.add("Profile PK: " + activity.profile_pk);
    if (checkString(activity.profile_first_name)) list.add("Profile First Name: " + activity.profile_first_name);
    if (checkString(activity.profile_last_name)) list.add("Profile Last Name: " + activity.profile_last_name);
    if (checkString(activity.profile_username)) list.add("Profile Username: " + activity.profile_username);
    if (checkString(activity.profile_membership_date)) list.add("Profile Membership Date: " + activity.profile_membership_date);
    if (checkString(activity.observing_site_uuid)) list.add("Observing Site UUId: " + activity.observing_site_uuid);
    if (checkString(activity.observing_site_name)) list.add("Observing Site Name: " + activity.observing_site_name);
    if (checkString(activity.observing_site_nickname)) list.add("Observing Site Nickname: " + activity.observing_site_nickname);
    if (checkString(activity.observing_site_alternate_names)) list.add("Observing Site Alternate Names: " + activity.observing_site_alternate_names);
    if (checkString(activity.observing_site_IAUCode)) list.add("Observing Site IAU Code: " + activity.observing_site_IAUCode);
    if (checkString(activity.observing_site_acronym)) list.add("Observing Site Acronym: " + activity.observing_site_acronym);
    if (checkString(activity.observing_site_homepage_url)) list.add("Observing Site Homepage Url: " + activity.observing_site_homepage_url);
    if (checkString(activity.observing_site_coordinates_longitude)) list.add("Observing Site Coordinates - Longitude: " + activity.observing_site_coordinates_longitude);
    if (checkString(activity.observing_site_coordinates_latitude)) list.add("Observing Site Coordinates - Latitude: " + activity.observing_site_coordinates_latitude);
    if (checkString(activity.observing_site_coordinates_height)) list.add("Observing Site Coordinates - Height: " + activity.observing_site_coordinates_height);
    if (checkString(activity.address_line_1)) list.add("Address Line 1: " + activity.address_line_1);
    if (checkString(activity.address_line_2)) list.add("Address Line 2: " + activity.address_line_2);
    if (checkString(activity.address_zip_code)) list.add("Address Zip Code: " + activity.address_zip_code);
    if (checkString(activity.address_state_province)) list.add("Address State Province: " + activity.address_state_province);
    if (checkString(activity.address_country)) list.add("Address State Country: " + activity.address_country);
    if (checkString(activity.address_time_zone_id)) list.add("Address State Time Zone Id: " + activity.address_time_zone_id);
    if (checkString(activity.address_time_zone_name)) list.add("Address State Time Zone Name: " + activity.address_time_zone_name);
    if (checkString(activity.address_time_zone_offset)) list.add("Address State Time Zone Offset: " + activity.address_time_zone_offset);
    if (checkString(activity.address_continent)) list.add("Address continent: " + activity.address_continent);
    if (checkString(activity.telescopes)) list.add("Telescopes: " + activity.telescopes);
    if (checkString(activity.images)) list.add("Images: " + activity.images);
    if (checkString(activity.is_active)) list.add("Active?: " + activity.is_active);
    if (checkString(activity.action)) list.add("Action: " + activity.action);
    if (checkString(activity.property_name)) list.add("Property Name: " + activity.property_name);
    if (checkString(activity.old_value)) list.add("Old Value: " + activity.old_value);
    if (checkString(activity.new_value)) list.add("New Value: " + activity.new_value);
    if (checkString(activity.action_message)) list.add("Action Message: " + activity.action_message);
    if (checkString(activity.method)) list.add("Method: " + activity.method);

    return list;
  }

  bool checkString(String detail) {

    if (detail != null && detail != "") {
      return true;
    } else {
      return false;
    }
  }

  bool checkArray(String detail) {

    if (detail != null && detail != "") {
      return true;
    } else {
      return false;
    }
  }

}