import 'dart:core';

class MeiJuListItem {
  List<SingleMeiJuListItem> lunbo;
  List<SingleMeiJuListItem> list;

  MeiJuListItem({required this.lunbo, required this.list});

  factory MeiJuListItem.fromJson(Map<String, dynamic> jsonResponse) {
    return MeiJuListItem(
      lunbo: (jsonResponse['lunbo'] as List)
          .map((e) => SingleMeiJuListItem.fromJson(e))
          .toList(),
      list: (jsonResponse['list'] as List)
          .map((e) => SingleMeiJuListItem.fromJson(e))
          .toList(),
    );
  }
}

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

  factory SingleMeiJuListItem.fromJson(Map<String, dynamic> jsonResponse) {
    return SingleMeiJuListItem(
      jsonResponse['id'],
      jsonResponse['title'],
      jsonResponse['otitle'],
      jsonResponse['zhuyan'],
      jsonResponse['daoyan'],
      jsonResponse['zhuti'],
      jsonResponse['img'],
      jsonResponse['m3u8'],
      jsonResponse['jianjie'],
    );
  }
}
