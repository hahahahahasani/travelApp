import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/model/wisata.dart';
import 'dart:convert';

class Repository {
  final String apiUrl = "https://wisata-3f801-default-rtdb.firebaseio.com/wisata.json?auth=E0FStoBTi5DaqBQgdCSCx4glJye6SLwYJHCajstv";

  Future<List<Wisata>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Wisata> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      dataPlaces = jsonData.values.map((value) {
        return Wisata.fromJson(value);
      }).toList();
      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}