import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:meiju_flutter/model/home_grid_item.dart';
import 'package:meiju_flutter/model/meiju_list_item.dart';

class MeiJuClient {
  static const baseURL = "http://app.bytwelder.com";

  Future<MeiJuListItem> fetchMeijuList(int page) async {
    final url = Uri.parse('$baseURL/dili/meiju/p/$page/type/1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      return MeiJuListItem.fromJson(jsonResponse);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<HomeGridItem> fetchMeijuXiangXi(String id) async {
    final url = Uri.parse('$baseURL/dili/meijuxiangxi/iid/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      return HomeGridItem.fromJson(jsonResponse);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
