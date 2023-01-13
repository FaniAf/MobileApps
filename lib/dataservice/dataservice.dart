import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laptopapi/classdata/classdata.dart';

Future<Cdata> getAllData() async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/users/2'));

  return Cdata.fromJson(jsonDecode(response.body));
}
