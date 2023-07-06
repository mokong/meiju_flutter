// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_grid_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeGridItem _$HomeGridItemFromJson(Map<String, dynamic> json) => HomeGridItem(
      json['iid'] as String,
      json['title'] as String,
      json['img'] as String,
      json['playtime'] as String,
      json['otitle'] as String?,
      json['jianjie'] as String?,
      json['daoyan'] as String?,
      json['zhuyan'] as String?,
      json['pingfen'] as String?,
      (json['list'] as List<dynamic>)
          .map((e) => HomeGridSingleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeGridItemToJson(HomeGridItem instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'title': instance.title,
      'img': instance.img,
      'playtime': instance.playtime,
      'otitle': instance.otitle,
      'jianjie': instance.jianjie,
      'daoyan': instance.daoyan,
      'zhuyan': instance.zhuyan,
      'pingfen': instance.pingfen,
      'list': instance.list,
    };

HomeGridSingleItem _$HomeGridSingleItemFromJson(Map<String, dynamic> json) =>
    HomeGridSingleItem(
      json['zhuti'] as String,
      json['bofang'] as String,
      json['down'] as String?,
    );

Map<String, dynamic> _$HomeGridSingleItemToJson(HomeGridSingleItem instance) =>
    <String, dynamic>{
      'zhuti': instance.zhuti,
      'bofang': instance.bofang,
      'down': instance.down,
    };
