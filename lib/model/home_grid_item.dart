import 'package:json_annotation/json_annotation.dart';

part 'home_grid_item.g.dart';

@JsonSerializable()
class HomeGridItem {
  final String iid;
  final String title;
  final String img;
  final String playtime;
  final String? otitle;
  final String? jianjie;
  final String? daoyan;
  final String? zhuyan;
  final String? pingfen;
  List<HomeGridSingleItem> list;

  HomeGridItem(this.iid, this.title, this.img, this.playtime, this.otitle,
      this.jianjie, this.daoyan, this.zhuyan, this.pingfen, this.list);

  factory HomeGridItem.fromJson(Map<String, dynamic> json) =>
      _$HomeGridItemFromJson(json);
}

@JsonSerializable()
class HomeGridSingleItem {
  final String zhuti;
  final String bofang;
  final String? down;

  HomeGridSingleItem(this.zhuti, this.bofang, this.down);

  factory HomeGridSingleItem.fromJson(Map<String, dynamic> jsonResponse) =>
      _$HomeGridSingleItemFromJson(jsonResponse);
}
