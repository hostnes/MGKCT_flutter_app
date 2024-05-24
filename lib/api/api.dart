import 'dart:ffi';
import 'dart:convert';
import 'package:dio/dio.dart';

class ConnectServer {
  static var base_url = 'http://193.168.49.29:8000/api/';
  static Dio dio = Dio();

  static Future<List<Map<String, dynamic>>> getTeachers() async {
    String url = '${base_url}get_teachers';
    Response response = await dio.get(url);
    List<Map<String, dynamic>> data = (response.data as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    return data;
  }

  static Future<List<String>> getGroups() async {
    String url = '${base_url}get_groups';
    Response response = await dio.get(url);
    List<String> data =
        (response.data as List<dynamic>).map((e) => e.toString()).toList();
    return data;
  }

  static Future<Map<String, dynamic>> getWeekDayData() async {
    String url = '${base_url}get_groups_data';
    Response response = await dio.get(url);
    Map<String, dynamic> responseData = response.data;

    if (responseData.containsKey("info")) {
      Map<String, dynamic> info = responseData["info"];
      return info;
    } else {
      return {};
    }
  }
}
