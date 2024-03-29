import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<dynamic,dynamic>> httpRequest(link) async {
  final uri = Uri.parse(link);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load');
  }
}