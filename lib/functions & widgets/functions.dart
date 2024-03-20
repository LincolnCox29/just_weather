import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<Position> determinePosition() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) {
      return Future.error('Location Permissions are denied');
    }
  }
  return await Geolocator.getCurrentPosition();
}

Future<Map<dynamic,dynamic>> httpRequest(link) async {
  final uri = Uri.parse(link);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load');
  }
}