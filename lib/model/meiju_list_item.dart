import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'meiju_list_item.g.dart';

@JsonSerializable()
class MeiJuListItem {
  List<SingleMeiJuListItem> lunbo;
  List<SingleMeiJuListItem> list;

  MeiJuListItem({required this.lunbo, required this.list});

  factory MeiJuListItem.fromJson(Map<String, dynamic> jsonResponse) =>
      _$MeiJuListItemFromJson(jsonResponse);
}

@JsonSerializable()
class SingleMeiJuListItem {
  final String id;
  final String title;
  final String? otitle;
  final String? zhuyan;
  final String? daoyan;
  final String? zhuti;
  final String img;
  final String? m3u8;
  final String? jianjie;

  SingleMeiJuListItem(this.id, this.title, this.otitle, this.zhuyan,
      this.daoyan, this.zhuti, this.img, this.m3u8, this.jianjie);

  factory SingleMeiJuListItem.fromJson(Map<String, dynamic> jsonResponse) =>
      _$SingleMeiJuListItemFromJson(jsonResponse);
}
