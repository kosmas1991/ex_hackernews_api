// To parse this JSON data, do
//
//     final ids = idsFromJson(jsonString);

import 'dart:convert';

List<int> idsFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));

String idsToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
