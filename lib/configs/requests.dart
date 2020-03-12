import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:json_placeholder/models/employee.dart';
import 'package:json_placeholder/models/post.dart';

final String BASE_URL = "https://jsonplaceholder.typicode.com/";

Future<List<Post>> getDataPostOfList() async {
  var response = await http.get(Uri.encodeFull("${BASE_URL}posts"),
      headers: {"Accept": "application/json"});

  final post = postFromJson(response.body);
  return post;
}

Future<Employee> getEmployees() async {
  var response = await http.get(Uri.encodeFull("http://dummy.restapiexample.com/api/v1/employees"),
      headers: {"Accept": "application/json"});

  final responseJson = json.decode(utf8.decode(response.bodyBytes));
  //print(Employee.fromJson(responseJson))
  print("Employee statusCode: " + response.statusCode.toString());
  //debugger();
  return Employee.fromJson(responseJson);
}
