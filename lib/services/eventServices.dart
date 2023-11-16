import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/EventsModel.dart';
import 'Utilities/app_url.dart';

class EventServices{
  Future<EventsModel> fetchAllEvents() async {
    final response = await http.get(Uri.parse(AppUrl.getAllEvents));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return EventsModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

}

