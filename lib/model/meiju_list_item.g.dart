// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meiju_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeiJuListItem _$MeiJuListItemFromJson(Map<String, dynamic> json) =>
    MeiJuListItem(
      lunbo: (json['lunbo'] as List<dynamic>)
          .map((e) => SingleMeiJuListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      list: (json['list'] as List<dynamic>)
          .map((e) => SingleMeiJuListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeiJuListItemToJson(MeiJuListItem instance) =>
    <String, dynamic>{
      'lunbo': instance.lunbo,
      'list': instance.list,
    };

SingleMeiJuListItem _$SingleMeiJuListItemFromJson(Map<String, dynamic> json) =>
    SingleMeiJuListItem(
      json['id'] as String,
      json['title'] as String,
      json['otitle'] as String?,
      json['zhuyan'] as String?,
      json['daoyan'] as String?,
      json['zhuti'] as String?,
      json['img'] as String,
      json['m3u8'] as String?,
      json['jianjie'] as String?,
    );

Map<String, dynamic> _$SingleMeiJuListItemToJson(
        SingleMeiJuListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'otitle': instance.otitle,
      'zhuyan': instance.zhuyan,
      'daoyan': instance.daoyan,
      'zhuti': instance.zhuti,
      'img': instance.img,
      'm3u8': instance.m3u8,
      'jianjie': instance.jianjie,
    };
