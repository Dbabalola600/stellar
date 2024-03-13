import 'dart:convert';
import 'package:http/http.dart' as http;

import 'request_settings.dart';

Future connect() async {
//  var body = info;
  String uri = "$baseUrl/";

  var url = Uri.parse(uri);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}

Future getAll() async {
//  var body = info;
  String uri = "$baseUrl/tasks";

  var url = Uri.parse(uri);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data["data"];
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}


Future getOne(id) async {
//  var body = info;
  String uri = "$baseUrl/tasks/getOne?id=$id";

  var url = Uri.parse(uri);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}

Future getCompleted() async {
//  var body = info;
  String uri = "$baseUrl/tasks/getCompleted";

  var url = Uri.parse(uri);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data["data"];
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}

Future newTask(title, content) async {
  Map info = {"title": title, "content": content};

  var body = info;
  String uri = "$baseUrl/tasks/create";

  var url = Uri.parse(uri);

  final response = await http.post(url, body: body);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}



Future markCompleted(id) async {
  Map info = {"_id": id,};

  var body = info;
  String uri = "$baseUrl/tasks/complete";

  var url = Uri.parse(uri);

  final response = await http.post(url, body: body);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}



Future deleteOne({id,}) async {
  // Map info = {"id": id,};

  // var body = info;
  String uri = "$baseUrl/tasks/deleteOne?id=$id";

  var url = Uri.parse(uri);

  final response = await http.delete(url,);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}


Future editOne({id, title, content}) async {
  Map info = {"title": title, "content": content};

  var body = info;
  String uri = "$baseUrl/tasks/editOne?id=$id";

  var url = Uri.parse(uri);

  final response = await http.put(url, body:body);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized: Invalid credentials");
  } else {
    throw Exception(
        "Failed to make the request. Status code: ${response.statusCode}");
  }
}
void main() async {
  // ignore: avoid_print
  print(await getAll());
  //  print(await editOne(  id: "65f1dc736898b8a3a0c87a54",title:" new", content: ""));
}
