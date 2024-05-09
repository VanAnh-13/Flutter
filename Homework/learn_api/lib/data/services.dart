import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_api/data/distinct.dart';
import 'package:learn_api/data/person.dart';
import 'package:learn_api/data/provinces.dart';

class PersonService {
  static Future<List<Person>> getData() async {
    var response = await http.get(
      Uri.parse(
          'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer'),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(
        utf8.decode(response.body.codeUnits),
      ) as List<dynamic>;

      return List.generate(
        body.length,
        (index) => Person.fromJson(body[index]),
      );
    } else {
      throw Exception('Failed to load person');
    }
  }

  static Future<http.Response> createPerson(Person person) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(
            'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(person.toJson()),
      );
    } catch (e) {
      throw Exception("Failed to create person");
    }

    return response;
  }

  static Future<http.Response> updatePerson(Person person, String id) async {
    http.Response? response;
    try {
      response = await http.put(
        Uri.parse(
            'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(person.toJson()),
      );
    } catch (e) {
      throw Exception("Failed to create person");
    }

    return response;
  }

  static Future<http.Response> deletePerson(String id) async {
    http.Response? response;
    try {
      response = await http.delete(
        Uri.parse(
            'https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/customer/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      throw Exception("Failed to create person");
    }

    return response;
  }
}

class ProvinceService {
  static Future<List<Provinces>> getProvinces() async {
    var response = await http.get(
      Uri.parse('https://vapi.vnappmob.com/api/province'),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(
        utf8.decode(response.body.codeUnits),
      ) as Map<String, dynamic>;

      return List.generate(
        body['results'].length,
        (index) => Provinces.fromJson(
          body['results'][index],
        ),
      );
    } else {
      throw Exception('Failed to load provinces');
    }
  }
}

class DistinctService {
  static Future<List<Distinct>> getDistinct(String? provinceId) async {
    var response = await http.get(
      Uri.parse("https://vapi.vnappmob.com/api/province/district/$provinceId"),
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(
        utf8.decode(response.body.codeUnits),
      ) as Map<String, dynamic>;

      return List.generate(
        body['results'].length,
        (index) => Distinct.fromJson(
          body['results'][index],
        ),
      );
    } else {
      throw Exception('Failed to load distinct');
    }
  }
}
